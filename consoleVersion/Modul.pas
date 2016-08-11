


{
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * *                                                               * * *
* * *                            UNIT                               * * *
* * *                    FILE kezelì elj†r†sok                      * * *
* * *                                                               * * *
* * *  KÇszÅlt: a BME êp°tì-Çs Anyagmozgat¢ GÇpek TanszÇkÇn         * * *
* * *                           1993.                               * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
}
Unit MODUL;
Interface
Uses Dos,Crt,Graph,ADAT,SEGED,VIZSGALA ;

  Procedure FILENEVBE(irany:t_IrasOlvasas;szoveg:DsplLin;var Err:boolean);
  Procedure LOAD1;      Procedure SAVE1;        Procedure LOAD2;
  Procedure SAVE2;      Procedure FILENEVE;     Procedure ADATBEHIVAS;
  Procedure EredFILEPRINT;
  Procedure FILEDISCRE(irany:t_IrasOlvasas;szoveg:DsplLin;var Err:boolean);
  Procedure FILEDISCROL(irany:t_IrasOlvasas;szoveg:DsplLin;var Err:boolean);
Implementation
  {______________________________________________________________________}

Procedure FILENEVBE; { BekÇri az adatokat tartalmaz¢ FILE nevet, Çs ir†sra
          vagy olvas†sra elìkÇsz°ti az "irany" ÇrtÇkÇtìl fÅggìen. IRèS: ha
          a file m†r lÇtezik azt *.BAK kiterjesztÇsñre †tnevezi (ha olyan
          is van, akkor azt tîrli); OLVASèSn†l: ha az adott nÇv nem lÇtezik
          a beh°v†st meg kell ismÇtelni. }
Begin
  Err:=FALSE;  DefExt:='.dpv';  FileNev:=''; ADATCIM; SetColor (ESzin);
  SetUserCharsize(4,7,2,5); yj:=6*yn;
  xj:=4*xk; SetViewport(0,0,getmaxx,getmaxy,clipon);
  Repeat                                     {Am°g a file kijelîlÇs nem j¢!}
    reset_hiba:=0; Err:=FALSE;
    OutTextxy(xj,yj,'A file neve :');              {BekÇri a FILE nevÇt}
    Repeat
      be:=ReadKey; If fhiba=1 Then Bar(0,0,getmaxx,yk);
      If be<>#13 Then FileNev:=FileNev+be; xa:=2*xk;
      SetFillPattern (ures,Aszin); SetViewport(2*xj,yj,2*xj+xa,yj+yk,clipon);
      Bar(0,0,2*xa,yk); OuttextXY(0,0,FileNev);
    Until (be=#13);
    i:=pos('.', FileNev);            {Innen adjuszt†lja a beadott filenevet}
    If i=0 Then Begin                        {Nem lett kiterjesztÇs beadva!}
                  If Length(FileNev)>9 Then       {A nÇv rÇsz "t£l" hossz£!}
                               FileNev:=Copy (FileNev, 1, 9);
                  FileNev:=FileNev+DefExt;
                End         {A kiterjesztÇs nÇlkÅl beadott nÇv adjusztal†sa}
           Else Begin                                    {Van kiterjesztÇs!}
                  If i>9 Then Begin                    {A nÇv "t£l" hossz£!}
                    FileNev:=Copy(FileNev,1,i-1);            {A nÇv mentÇse}
                    FileNev:=FileNev+DefExt
                              End
                 End;           {A kiterjesztÇssel beadott nÇv adjuszt†l†sa}
    Assign (AdatFile, FileNev);
    {$I-} Reset (AdatFile); {$I+}
    Reset_hiba:=IOResult;                    {Az olvas†sra-nyit†s st†tusza!}
    Case Irany of                          {Innen "Ir†ny"-fÅggì hibakezelÇs}
      Olvasas: Begin
                 If reset_hiba<>0                      {A file nem lÇtezik!}
                   Then Begin
                          Bar(0,0,xa,yk);
                          SetViewport(0,0,getmaxx,getmaxy,clipon);
                          SetViewport(xd,yj+yk,getmaxx-xd,yj+2*yk,clipon);
                          Bar(xd,0,getmaxx-xd,yk);
                          OutTextxy(xj,0,'Nincs ilyen FILE nÇv !');
                          fhiba:=1; FileNev:='';
                        End
                   Else Begin       {A file lÇtezik, verzi¢sz†mot ellenìrzi}
                          ActData.Ident:=Version; fhiba:=0;
                          Seek(AdatFile,1);
                          {$I-} Read(AdatFile,ActData); {$I+}
                          If IOResult<>0
                            Then reset_hiba:=111
                            Else Begin        {A file struktur†ja megfelelì}
                                   if ActData.ActVersion<>VerzioSzam
                                     Then reset_hiba:=111;
                                 End;
                        End;
                  If reset_hiba=0                 {Beolvassa a file mÇretÇt}
                    Then FileMeret:=FileSize(AdatFile);
               End;
      Iras:    Begin
                 If reset_hiba=0
                   Then Begin    
                          ujj:=0;{A beadott nÇv foglalt, de nincs a list†n!}
                          For k:=1 to inev do
                            If cimek[k]=FileNev Then Begin ujj:=1; k:=inev;End;
                          If ujj=0 Then Begin
                                     inev:=inev+1; cimek[inev]:=FileNev; End;
                        End
                   Else Begin
                          If inev<=40 Then Begin
                             inev:=inev+1; cimek[inev]:=FileNev; End; End;
               Rewrite(AdatFile);           {Fizikailag lÇtrehozza a file-t}
               ActData.Ident:=Version; ActData.ActVersion:=VerzioSzam;
               Seek(AdatFile,1);  Write(AdatFile,ActData); Err:=FALSE;
               {$I-}{ Reset (AdatFile); }{$I+} Reset_hiba:=IOResult; fhiba:=0;
             End                                     {Az °r†sra val¢ nyit†s}
      End
    Until ((reset_hiba=0) and (fhiba=0));
End; {___________________________________________________________________}
Procedure LOAD1;      { Az input adatsor beolvas†sa. A FILE nyitva marad!}
Begin
  ActData.Ident:=InpConst1;                {Inicializ†lja a munkav†ltoz¢t}
  Seek(AdatFile,2);  Read (AdatFile,ActData);       {Beolvassa a file-bìl}
  For i:=1 to 21 do a[i]:=ActData.a[i];
  nn:=a[1];  exc:=a[2]; res:=a[3]; B0:=a[4];  al:=a[5];  Hm:=a[6];
  Hf:=a[7];  Lf:=a[8];  Hn:=a[9];  Ln:=a[10]; L0:=a[11]; bet:= a[12];
  e0:=a[13]; em:=a[14]; Df:=a[19]; ro:=a[20]; w:=a[21];
End;  {__________________________________________________________________}
Procedure SAVE1;{Adatsor ki°r†sa a m†r nyitott FILE-ba. Bez†rja a file-t }
Begin
  ActData.Ident:=InpConst1;                {Inicializ†lja a munkav†ltoz¢t}
  For i:=1 to 21 do ActData.a[i]:=a[i];
  Seek(AdatFile,2);                     {Ki°rja a munkav†ltoz¢t a file-ba}
  Write(AdatFile,ActData); Close(Adatfile); FN:=FileNev;
End; {___________________________________________________________________}
Procedure FILEDISCROL;      { Adat FILE-ok nevÇnek kiolvas†sa a DISC-rìl.}
Begin
  FileNev:='FekvoDUP.CIM';  Assign (CimFile, FileNev);
  {$I-} Reset (CimFile); {$I+}
  Reset_hiba:=IOResult;                    {Az olvas†sra-nyit†s st†tusza!}
  If Irany=Olvasas Then LOAD2; i:=1;     {Innen "Ir†ny"-fÅggì hibakezelÇs}
  Repeat
    FileNev:=cimek[i]; reset_hiba:=0; Err:=FALSE;
    Assign (AdatFile, FileNev); {$I-} Reset (AdatFile); {$I+}
    Reset_hiba:=IOResult;                  {Az olvas†sra-nyit†s st†tusza!}
    If reset_hiba<>0                                 {A file nem lÇtezik!}
      Then Begin
             For k:=i to inev-1 do cimek[k]:=cimek[k+1];
             cimek[inev]:=''; inev:=inev-1;
           End  Else Begin i:=i+1; Close(Adatfile); End;
  Until cimek[i]='';
End; {___________________________________________________________________}
Procedure LOAD2;          { A 'cim.cim' nevñ FILE adatsor†nak beolvas†sa!}
Begin
  ActData.Ident:=InpConst2;                {Inicializ†lja a munkav†ltoz¢t}
  Seek(CimFile,2);  Read (CimFile,ActData);         {Beolvassa a file-bìl}
  inev:=ActData.inev; For i:=1 to 40 do cimek[i]:=ActData.cimek[i];
End; {___________________________________________________________________}
Procedure SAVE2;{ Adat FILE-ok c°meinek ki°r†sa a 'cim.cim' nevñ FILE-ba.}
Begin
  ActData.Ident:=InpConst2;                {Inicializ†lja a munkav†ltoz¢t}
  ActData.inev:=inev; For i:=1 to 40 do ActData.cimek[i]:=cimek[i];
  Seek(CimFile,2);                      {Ki°rja a munkav†ltoz¢t a file-ba}
  Write(CimFile,ActData); Close(Cimfile);
End; {___________________________________________________________________}
Procedure FILEKEZ;     { A bemenì adatok Çs eredmÇnyek rîgzitÇse file-ba.}
Begin
  tdat:='1';
  If not(DkeyB)
      Then Begin                                                    {DISC}
             Repeat FILENEVBE(olvasas,'(input)',Err);  Until not(Err);
             LOAD1;   End
      Else Begin                                            {billentyñzet}
             Repeat FILENEVBE(iras,'(output)',Err);    Until Not(Err);
             SAVE1;   End;
End; {___________________________________________________________________}
Procedure FILEDISCRE;               { Adat FILE-ok nevÇnek DISC-re °r†sa.}
Begin
  Err:=FALSE;  FileNev:='FekvoDUP.CIM';
  Assign (CimFile, FileNev);  {$I-} Reset (CimFile); {$I+}
  Reset_hiba:=IOResult;                    {Az olvas†sra-nyit†s st†tusza!}
  If Irany=Iras                          {Innen "Ir†ny"-fÅggì hibakezelÇs}
    Then Begin
           If reset_hiba=0 Then Begin    {A beadott nÇv foglalt!}  End;
           Rewrite(CimFile);              {Fizikailag lÇtrehozza a file-t}
           ActData.Ident:=Version; ActData.ActVersion:=VerzioSzam;
           Seek(CimFile,1);  Write(CimFile,ActData); Err:=FALSE;
           {$I-}{ Reset (CimFile); }{$I+} Reset_hiba:=IOResult; fhiba:=0;
        End;
End; {___________________________________________________________________}
Procedure FILELISTA;                              { FILE nevÇnek ki°r†sa.}
Begin
  xg:=7*xn; yg:=8*yk;
  For i:=1 to inev do
    Begin n:=(i-1) div 4; k:=i-n*4; OutTextxy(k*xg,yg+n*yk,cimek[i]); End;
End; {___________________________________________________________________}
Procedure ADATBEHIVAS;     { Adatok bevitele DISC-rìl,Çs ki°r†sa DISC-re.}
Begin
  y0:=2*yn; xa1:=trunc(15*ex); ya1:=9*yk; xa2:=3*xk; ya2:=yk;
  ADATCIM; SetTextJustify(1,2);
  If ((me=0) or (me=1))
    Then Begin
           DkeyB:=false; OutTextxy(xa2,ya1-2*yk,' FILE-nevek v†lasztÇka :');
         End
    Else Begin
           OutTextxy(koz,2*yk,   '( adatok DISC-re ir†sa)');
           OutTextxy(xa2,ya1-2*yk,' Lefoglalt FILE-nevek :');
         End;
  FILELISTA; FILEKEZ; ADATCIM;
End; {___________________________________________________________________}
Procedure FILENEVE;          { BekÇri az adatokat tartalmaz¢ FILE nevÇt. }
Begin
  Err:=FALSE; DefExt:='.txt';  EredNev:='';
  Repeat                                     {Am°g a file kijelîlÇs nem j¢!}
    reset_hiba:=0; Err:=FALSE;                         {BekÇri a FILE nevÇt}
    OutTextxy(xd,xd+yk,'A file neve : . . . ');
    Repeat
      be:=ReadKey; If fhiba=1 Then Bar(0,0,3*xk,yk);
      If be<>#13 Then EredNev:=EredNev+be; SetColor(ESzin);
      xa:=2*xk; SetFillPattern (ures,Aszin);
      SetViewport(xb+3*xk,yb+yk+xd,xb+3*xk+xa,yb+2*yk+xd,clipon);
      Bar(0,0,xa,yk); OuttextXY(0,0,EredNev);
    Until (be=#13);
    i:=pos('.', EredNev);            {Innen adjuszt†lja a beadott filenevet}
    If i=0 Then Begin                        {Nem lett kiterjesztÇs beadva!}
                  If Length(EredNev)>9 Then       {A nÇv rÇsz "t£l" hossz£!}
                               EredNev:=Copy (EredNev, 1, 9);
                  EredNev:=EredNev+DefExt;
                End         {A kiterjesztÇs nÇlkÅl beadott nÇv adjusztal†sa}
           Else Begin                                    {Van kiterjesztÇs!}
                  If i>9 Then Begin                    {A nÇv "t£l" hossz£!}
                    EredNev:=Copy(EredNev,1,i-1);            {A nÇv mentÇse}
                    EredNev:=EredNev+DefExt
                              End
                 End;           {A kiterjesztÇssel beadott nÇv adjuszt†l†sa}
    Assign (EredFile, EredNev);
  Until (reset_hiba=0);
End; {___________________________________________________________________}
Procedure EredFILEPRINT;                        { EredmÇnyek FILE-ba ir†sa.}
Begin
  Close(Output); Assign(Output,EredNEV); Rewrite(Output);
  sorok:='A FILE cime: * '+EredNEV+' *'; WriteLn(sorok);
  sorok:='    '; WriteLn(sorok);
  WriteLn('         Bemenã adatok:'); WriteLn(sorok);
  WriteLn('     *********************************************************');
  WriteLn('     * Tengely fordulatsz†ma,         n [ 1/min ] *  ',a[1]:6:1,'  *');
  WriteLn('     *         excentricit†sa,           r [ mm ] *  ',a[2]:6:1,'  *');
  WriteLn('     * RÇsny°l†s - nÇvleges,             e [ mm ] *  ',a[3]:6:1,'  *');
  WriteLn('     *           - minim†lis,           e0 [ mm ] *  ',a[13]:6:1,'  *');
  WriteLn('     *           - maxim†lis,           em [ mm ] *  ',a[14]:6:1,'  *');
  WriteLn('     * TîrãtÇr (pofa) magass†ga,         B [ mm ] *  ',a[4]:6:1,'  *');
  WriteLn('     * Pofa hajl†sszîge,             alfa [ FOK ] *  ',a[5]:6:2,'  *');
  WriteLn('     * TîrãtÇr (pofa) hossza,           Hm [ mm ] *  ',a[6]:6:1,'  *');
  WriteLn('     * Pofa felsã pont - hosszir†ny,    Hf [ mm ] *  ',a[7]:6:1,'  *');
  WriteLn('     *                 - keresztir†ny,  Lf [ mm ] *  ',a[8]:6:1,'  *');
  WriteLn('     * Pofa t†masz - hosszir†ny,        Hn [ mm ] *  ',a[9]:6:1,'  *');
  WriteLn('     *             - keresztir†ny,      Ln [ mm ] *  ',a[10]:6:1,'  *');
  WriteLn('     * Nyom¢lap - teljes hossza,        L0 [ mm ] *  ',a[11]:6:1,'  *');
  WriteLn('     *          - hajl†sszîge,          · [ FOK ] *  ',a[12]:6:2,'  *');
  WriteLn('     *********************************************************');
  WriteLn('     * Feladott anyag - max. mÇret,   Dmax [ mm ] *  ',a[19]:6:1,'  *');
  WriteLn('     *                - s˚r˚sÇg,      ro [ t/m3 ] *  ',a[20]:6:2,'  *');
  WriteLn('     *                - BOND-tÇnyezã, w [ kW¢/t ] *  ',a[21]:6:2,'  *');
  WriteLn('     *********************************************************');
  WriteLn(sorok); WriteLn('    Technol¢giai jellemzãk:'); WriteLn(sorok);
  WriteLn('********************************************************************');
  WriteLn('* RÇsny°l†s ( e, mm )                   * ',a[13]:6:1,' * ',a[14]:6:1,' * ',a[3]:6:1,' *');
  WriteLn('********************************************************************');
  WriteLn('* Garat ny°l†s ( W, mm )                * ',b[19,1]:6:1,' * ',b[19,9]:6:1,' * ',b[19,0]:6:1,' *');
  WriteLn('* Pof†k îsszlîkete ( s , mm )           * ',b[9,1]:6:2,' * ',b[9,9]:6:2,' * ',b[9,0]:6:2,' *');
  WriteLn('* Pof†k t†vols†ga - min. ( e min , mm ) * ',b[10,1]:6:2,' * ',b[10,9]:6:2,' * ',b[10,0]:6:2,' *');
  WriteLn('*                 - max. ( e max , mm ) * ',b[11,1]:6:2,' * ',b[11,9]:6:2,' * ',b[11,0]:6:2,' *');
  WriteLn('* Teljes°tìkÇpessÇg ( Qe , t/¢ )        * ',b[12,1]:6:2,' * ',b[12,9]:6:2,' * ',b[12,0]:6:2,' *');
  WriteLn('* Motor teljes°tmÇny ( Pn , kW )        * ',b[13,1]:6:2,' * ',b[13,9]:6:2,' * ',b[13,0]:6:2,' *');
  WriteLn('* L†ncp†lya sebessÇge ( v l , m/s )     * ',b[14,1]:6:3,' * ',b[14,9]:6:3,' * ',b[14,0]:6:3,' *');
  WriteLn('********************************************************************');
  WriteLn('* Erãk - eredã tîrãerã ( Ft ,kN )       * ',b[16,1]:6:1,' * ',b[16,9]:6:1,' *');
  WriteLn('*      - nyom¢lapra hat¢ erã ( Fn ,kN ) * ',b[17,1]:6:1,' * ',b[17,9]:6:1,' *');
  WriteLn('*      - tengelyre hat¢ erã ( Fcs ,kN ) * ',b[18,1]:6:1,' * ',b[18,9]:6:1,' *');
  WriteLn('***********************************************************');
  WriteLn(sorok); WriteLn('               A rÇsny°l†s v†ltoztat†s†nak hat†sa:'); WriteLn(sorok);
  WriteLn('           ********************************************');
  WriteLn('           *   res   *     Q    *     P    *     vl   *');
  WriteLn('           *  [ mm ] *  [ t/¢ ] *  [ kW ]  *  [ m/s ] *');
  WriteLn('           ********************************************');
  For i:=1 to 9 do
    Begin
      str(b[1,i]:6:1,ada); sorok:='           * '+ada+cs;
      For k:=12 to 14 do Begin
        If k=14 Then str(b[k,i]:7:3,ada) Else str(b[k,i]:7:2,ada);
        sorok:=sorok+ada+cs; End;
      WriteLn(sorok);
    End;
  WriteLn('           ********************************************');
  sorok:='    '; WriteLn(sorok); WriteLn(sorok); WriteLn(sorok);
  WriteLn(sorok); WriteLn(sorok); WriteLn(sorok); WriteLn(sorok);
  WriteLn('A pofa egyes pontjainak - 5 fokonkÇnti - elmozdul†sa, mm-ben:'); WriteLn(sorok);
  WriteLn('*     a.pont    *     b.pont    *     c.pont    *     d.pont    *     e.pont    *');
  WriteLn('*   x   *   y   *   x   *   y   *   x   *   y   *   x   *   y   *   x   *   y   *');
  For i:=0 to 72 do
    Begin
      sorok:='*';
      For k:=1 to 10 do Begin If 2*trunc(k/2)=k Then str(ar[i,k]:6:2,ada)
                                                Else str(-ar[i,k]:6:2,ada);
      sorok:=sorok+ada+' *'; End;
      WriteLn(sorok);
    End;
  Close(Output); AssignCrt(Output); ReWrite(Output);
  SetViewport(0,0,getmaxx,getmaxy,clipon);
End; {_____________________________________________________________________}


Begin
End.
    {____________________________________________________________________}


