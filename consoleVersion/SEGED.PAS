

{
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * *                                                               * * *
* * *                   Pof†s kãtîrãgÇp mozg†sa                     * * *
* * *                        SEGED  UNIT                            * * *
* * *                                                               * * *
* * *  KÇszÅlt: a BME êp°tì-Çs Anyagmozgat¢ GÇpek TanszÇkÇn         * * *
* * *  KÇsz°tette:dr.R†cz KornÇlia egy.adjunktus                    * * *
* * *                           1997.                               * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
}
 { Ez a  UNIT az almenÅket Çs a segÇd elj†r†sokat tartalmazza. }

Unit SEGED;
Interface
Uses Dos,Crt,Graph,ADAT;
  Procedure TESZTEL;   Procedure FILEba;  Procedure NODATA; Procedure TOVABB;
  Procedure NULLAZAS1; Procedure ADATCIM; Procedure KERET;  Procedure MENUHOZ;
  Procedure NULLAZAS;  Procedure MENU0;   Procedure UJLAP;  Procedure FILENEVIR;
  Procedure VALASZT2;  Procedure GOROGB;  Procedure MENU2;  Procedure MELYIK;
  Procedure FELIRAT; Function Arccos(x:real):real;

Implementation
  {________________________________________________________________________}
Procedure TESZTEL;    { A graf. hardver tesztelÇse, kÇpernyì Çs szin be†ll.}
Begin
  grDriver:= detect; InitGraph(GrDriver,GrMode,''); errcode := GraphResult;
  If errcode <> grOk Then WriteLn('Graphics error:',GraphErrorMsg(ErrCode));
  ESzin:=4{14};  Hatter:=15; SetPalette(14,0);
  SetBkColor(Hatter); ASzin:=14;
  Case Grdriver of
    3: Begin GetAspectRatio(xasp,yasp); ex:=1.0; ey:=xasp/yasp; End; { EGA }
    9: Begin GetAspectRatio(xasp,yasp); ex:=1;   ey:=xasp/yasp; End; { VGA }
  End;
  q:=trunc(6*ey); koz:=succ(getmaxx) div 2; xd:=trunc(8*ex); yd:=trunc(8*ey);
  yk:=trunc(25*ey); xn:=trunc(20*ex); yn:=trunc(20*ey); xk:=trunc(50*ex);
  szi[1]:=9; szi[2]:=10; szi[3]:=12; szi[4]:=3; szi[5]:=14; cs:='  * ';
  tex[1]:='a.'; tex[2]:='b.'; tex[3]:='c.'; tex[4]:='d.'; tex[5]:='e.';
  jel[1]:='n - a tengely percenkÇnti fordulatsz†ma';
  jel[2]:='r - a tengely excentricit†sa';
  jel[3]:='e - nÇvleges rÇsny°l†s (exc. als¢ helyzetÇben)';
  jel[4]:='B - a pof†k (tîrìtÇr) magass†ga';
  jel[5]:='‡ - a pof†k hajl†sszîge ( l†sd †bra )';
  jel[6]:='Hm - a pof†k (tîrìtÇr) hossza (l†sd †bra)';
  jel[7]:='Hf - pofa felsì pont - hosszir†ny (l†sd †bra)';
  jel[8]:='Lf - pofa felsì pont - keresztir†ny (l†sd †bra)';
  jel[9]:='Hn - pofa t†masz helye - hosszir†ny (l†sd †bra)';
  jel[10]:='Ln - pofa t†masz helye - keresztir†ny (l†sd †bra)';
  jel[11]:='L0 - a nyom¢lap teljes hossza (l†sd †bra)';
  jel[12]:='· - a nyom¢lap hajl†sszîge (l†sd †bra)';
  jel[13]:='e0 - minim†lis rÇsny°l†s (exc. als¢ helyzetÇben)';
  jel[14]:='em - maxim†lis rÇsny°l†s (exc. als¢ helyzetÇben)';
  jel1[1,1]:= ' n            1/min'; jel1[1,2]:= '    ';
  jel1[2,1]:= ' r             mm   '; jel1[2,2]:= '    ';
  jel1[3,1]:= ' e             mm   '; jel1[3,2]:= '    ';
  jel1[4,1]:= ' B             mm   '; jel1[4,2]:= '    ';
  jel1[5,1]:= ' ‡                  '; jel1[5,2]:= '  o ';
  jel1[6,1]:= 'H              mm   '; jel1[6,2]:= '  m ';
  jel1[7,1]:= 'H              mm   '; jel1[7,2]:= '  f ';
  jel1[8,1]:= 'L              mm   '; jel1[8,2]:= '  f ';
  jel1[9,1]:= 'H              mm   '; jel1[9,2]:= '  n ';
  jel1[10,1]:='L              mm   '; jel1[10,2]:='  n ';
  jel1[11,1]:='L              mm   '; jel1[11,2]:='  o ';
  jel1[12,1]:=' ·                  '; jel1[12,2]:='  o ';
  jel1[13,1]:='e              mm   '; jel1[13,2]:='  0 ';
  jel1[14,1]:='e              mm   '; jel1[14,2]:='  m ';
End; {_____________________________________________________________________}
Function Arccos(x:real):real;           { arccos fÅggvÇny, eredmÇny radban }
Begin
  If abs(x)<1 Then Arccos:=-arctan(x/sqrt(1-sqr(x)))+pi/2
              Else If (abs(x)-1)<=epsz Then If (x>0) Then Arccos:=0
                                                     Else Arccos:=pi;
End; {_____________________________________________________________________}
Procedure NULLAZAS;              {A kezdeti v†ltoz¢k null†z†sa, alapadatok.}
Begin
  adatok:=0; hi:=0; hiba:=0; ada:=''; alf:=0; me:=0; n:=72; k:=5;
  vme:=400; For i:=1 to 21 do Begin a[i]:=0; End;
End; {_____________________________________________________________________}
Procedure NULLAZAS1;                       {A sz†m°tott v†ltoz¢k null†z†sa.}
Begin
  For i:=0 to n do Begin For j:=1 to 8 do sr[i,j]:=0; End;
End; {_____________________________________________________________________}
Procedure NODATA;             { öres adatt†rak esetÇn kÇri az adatbevitelt.}
Begin
  UJLAP; SetUserCharsize(1,1,1,1);
  If hi=0 Then OutTextxy(koz,9*yn,'N I N C S  A D A T !')
          Else OutTextxy(koz,9*yn,'ö t k î z n e k  a  p o f † k !');
  SetUserCharsize(4,5,4,5);
  OutTextxy(koz,10*yk,'Hivja az adatbevitelt'); MENUHOZ;
End; {_____________________________________________________________________}
Procedure ADATCIM;                    { Az adatok megnevezÇsÇnek form†tuma.}
Begin
  SetColor(Aszin); SetTextStyle(1,0,1);  SetTextJustify(0,2);
  SetUserCharsize(1,2,2,5); SetLineStyle(0,0,1);
  SetViewport(0,0,getmaxx,getmaxy,clipon);
End; {_____________________________________________________________________}
Procedure KERET;                      { Szîveges utas°t†s ki°r†s†nak helye.}
Begin
  SetTextStyle(0,0,1); SetColor(Eszin); SetTextjustify(0,2);
  SetLineStyle(0,0,1); SetViewport(xf,yf,xf+xa,yf+ya,clipon); ClearViewport;
  Rectangle(0,0,xa,ya); Rectangle(2,2,xa-2,ya-2); SetColor(Aszin);
End; {_____________________________________________________________________}
Procedure FILENEVIR;                    { Az aktu†lis FILE nevÇnek ki°r†sa.}
Begin
  yf:=trunc(5*ey); ya:=yk; xa:=2*xk+xd; xf:=trunc(5*ex); KERET;
  SetTextjustify(1,2); OutTextxy(xa div 2,yd,FileNev);
  SetTextStyle(1,0,4); SetUserCharsize(1,1,4,5); SetTextJustify(1,1);
  SetViewport(0,0,getmaxx,getmaxy,clipon);
End; {_____________________________________________________________________}
Procedure UJLAP;                         {KÇpernyì elìkÇsz°tÇse £j menÅhîz.}
Begin
  SetColor(Aszin); SetViewport(0,0,getmaxx,getmaxy,clipon); ClearViewport;
  SetTextStyle(1,0,4); SetUserCharsize(1,1,4,5); SetTextJustify(1,1);
  Rectangle(0,1,getmaxx,getmaxy); Rectangle(3,3,getmaxx-3,getmaxy-2);
End; {_____________________________________________________________________}
Procedure MENUHOZ;                { A MENU-hîz val¢ visszatÇrÇs SPACE-szel.}
Begin
  yf:=17*yk+yd+q; xf:=xn; xa:=6*xn; ya:=yk; KERET;
  OutTextxy(xd,yd,'MenÅ:...SPACE'); Repeat sp:=readkey; Until sp=' ';
End; {_____________________________________________________________________}
Procedure TOVABB;                 { A MENU-hîz val¢ visszatÇrÇs SPACE-szel.}
Begin
  yf:=17*yk+yd+q; xf:=xn; xa:=7*xn; ya:=yk; KERET;
  OutTextxy(xd,yd,'Tov†bb:...SPACE'); Repeat sp:=readkey; Until sp=' ';
End; {_____________________________________________________________________}
Procedure MENU0;               { Az adatok jav°t†s†nak kezelÇsi £tmutat¢ja.}
Begin
  xf:=19*xn; xa:=4*xk+xn+2; yf:=4*yn; ya:=yk+4*yn;
  If me>3 Then Begin yf:=5*yn; ya:=yk+3*yn; End; KERET; x:=9*xn;
  OutTextxy(xd,yd,     'Adat elfogad†s...... ENTER');
  OutTextxy(xd,yd+yn,  'LÇptetÇs fel, jobbra.'); OutTextxy(xd+x,yd+yn,chr(24));
  OutTextxy(xd,yd+2*yn,'LÇptetÇs le, balra...'); OutTextxy(xd+x,yd+2*yn,chr(25));
  OutTextxy(xd,yd+3*yn,'Javit†s vÇge......... ESC');
  If me<3 Then OutTextxy(xd,yd+4*yn,'Ar†nyos †bra.........  A');
  ADATCIM;
End; {_____________________________________________________________________}
Procedure FILEba;                             {Mozg†sp†lya adatainak mentÇse}
Begin
  xf:=8*xk+2*xn; xa:=4*xk-xn; yf:=16*yk+xd; ya:=yk+xn; KERET;
  OutTextxy(xd,xd,'EREDMENY file-ba   E');
  OutTextxy(xd,xd+xn,'MenÅ........... SPACE');
  Repeat sp:=readkey; Until ((sp='e') or (sp='E') or (sp=' ')); ADATCIM;
End; {_____________________________________________________________________}
Procedure MENU2;               { Az adatok jav°t†s†nak kezelÇsi £tmutat¢ja.}
Begin
  xf:=10*xn; xa:=4*xk+3*xn+2; yf:=6*yn; ya:=yk+10*yn+yd; KERET; x:=9*xn;
  OutTextxy(xd,2*yd+yn,  'Pof†k îsszlîkete..........  1');
  OutTextxy(xd,2*yd+2*yn,'Teljes°tìkÇpessÇg.........  2');
  OutTextxy(xd,2*yd+3*yn,'Motor teljes°tmÇny........  3');
  OutTextxy(xd,2*yd+4*yn,'Kapar¢l†nc sebessÇge......  4');
  OutTextxy(xd,2*yd+5*yn,'Tîrìerì...................  5');
  OutTextxy(xd,2*yd+6*yn,'Nyom¢lap erì..............  6');
  OutTextxy(xd,2*yd+7*yn,'Tengelyre hat¢ erì........  7 ');
  OutTextxy(xd,2*yd+8*yn,'Fajlagos teljes°tìkÇpessÇg  8 '); SetColor(Eszin);
  If di=0 Then Begin OutTextxy(xd,2*yd,'           DIAGRAMOK');
                     OutTextxy(xd,2*yd+9*yn,'T†bl†zat, adatmentÇssel... ESC'); End
          Else Begin OutTextxy(xd,2*yd,'   TµBLµZATOK, ADATMENTêSSEL');
                     OutTextxy(xd,2*yd+9*yn,'Diagramok................. ESC'); End;
  OutTextxy(xd,2*yd+10*yn,'Vissza a MENöHôZ..........SPACE');
  ADATCIM; Repeat c1:=readkey; Until((c1 in c1_char));
  val(c1,i0,m); i0:=i0+3;
End; {_____________________________________________________________________}
Procedure MELYIK;                    { EredmÇnyek:'1'-diagram,'2'-t†bl†zat}
Begin
  UJLAP; ADATCIM; SetUserCharsize(5,6,3,5); c1:=' '; MENU2;
  If c1=' ' Then Begin i0:=0; End
            Else If c1=#27 Then Begin If di=0 Then di:=1 Else di:=0;
                                      i0:=0; MENU2; End
                           Else Begin val(c1,i0,m); i0:=i0+3; End;
End; {_____________________________________________________________________}
Procedure VALASZT2;                                  { Adatsor kiv†laszt†s }
Begin
  SetTextJustify(0,2);
  OutTextxy(3*xk,y0+2*yd,'Van megfelelì adat ?      - IGEN    - NINCS');
  SetColor(Eszin); OutTextxy(7*xk,y0+2*yd,'i         n');
  Repeat c0:=readkey; Until((c0='i') or (c0='n') or (c0='N') or (c0='I'));
End; {_____________________________________________________________________}
Procedure FELIRAT;                                 { Diagramok feliratozasa }
Begin
  UJLAP; If uj=2 Then FILENEVIR; SetUserCharsize(1,2,1,2);
  OutTextxy(koz,3*yn-yd,' ( a nÇvleges rÇsny°l†sn†l )');
  SetUserCharsize(3,5,4,7); x0:=4*xk-xd; y0:=19*yn;
  Case i0 of
      4 : Begin st3:='s  ,mm'; st2:='î';
                OutTextxy(koz,yn+yd,'A pof†k îsszes lîkete'); End;
      5 : Begin st3:='Q  ,t/¢'; st2:='n';
                OutTextxy(koz,yn+yd,'ElmÇleti teljes°tìkÇpessÇg'); End;
      6 : Begin st3:='P  ,kW'; st2:='e';
                OutTextxy(koz,yn+yd,'NÇvleges motor teljes°tmÇny'); End;
      7 : Begin st3:='v  ,m/s'; st2:='l';
                OutTextxy(koz,yn+yd,'L†ncp†lya sebessÇge'); End;
      8 : Begin st3:='F  ,kN'; st2:='t';
                OutTextxy(koz,yn+yd,'Eredì tîrìerì'); End;
      9 : Begin st3:='F  ,kN'; st2:='n';
                OutTextxy(koz,yn+yd,'Nyom¢lapra hat¢ erì'); End;
     10 : Begin st3:='F  ,kN'; st2:='c';
                OutTextxy(koz,yn+yd,'Tengelyre hat¢ erì'); End;
     11 : Begin st3:='Q/P ,t/kW¢'; st2:='';
                OutTextxy(koz,yn+yd,'Fajlagos teljes°tìkÇpessÇg'); End;
  End;
End; {______________________________________________________________________}
Procedure GOROGB;                            { Gîrîg betñk ki°r†sa: o-omega}
Begin
  xbe:=trunc(int((xbe+4)/8)*8); ybe:=trunc(int((ybe+12)/8)*8);
  SetFillPattern(betu,Aszin);   Bar(xbe,ybe,xbe+7,ybe+7);
End; {_____________________________________________________________________}


Begin
End.
{**********************************  E N D  *******************************}
