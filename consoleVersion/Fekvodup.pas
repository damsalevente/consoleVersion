


{
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * *                                                               * * *
* * *          Fekvã elrendezÇs˚ DUPLEX tîrìgÇp mÇretezÇse          * * *
* * *                          PROGRAM                              * * *
* * *                                                               * * *
* * *  KÇszÅlt: a BME êp°tì-Çs Anyagmozgat¢ GÇpek TanszÇkÇn         * * *
* * *  KÇsz°tette: dr.R†cz KornÇlia egy.adjunktus                   * * *
* * *                         2001-2004                             * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
}
{ A program a PROJECTOR Kft. megb°z†sa alapj†n, a fekvã elrendezÇs˚ DUPLEX
  tîrìgÇpek tervezÇsÇhez kÇszÅlt. }

Program FekvoDUP;
Uses Dos,Crt,Graph,ADAT,ABRA,SEGED,MODUL,VIZSGALA;
   {________________________________________________________________________}
Procedure CIMLAP;                             { A program, Çs a tanszÇk neve}
Begin
  SetColor(Aszin); SetBkColor(hatter);
  Rectangle(0,0,getmaxx,getmaxy); Rectangle(3,2,(getmaxx-3),(getmaxy-2));
  SetTextStyle(1,0,4); SetTextJustify(1,1); SetUserCharsize(5,4,1,1);
  OutTextxy(koz,5*yn,'V°zszintes elrendezÇsñ');
  OutTextxy(koz,5*yn+2*yk,'DUPLEX tîrìgÇp mÇretezÇse');
  SetTextStyle(1,0,1); SetUserCharsize(2,3,2,3);
  OutTextxy(koz,8*yn+2*yk,'( A pofa t†masz helyÇnek v†ltoztat†s†val )');
  SetUserCharsize(4,7,4,7);
  OutTextxy(koz,12*yk,'KÇszÅlt: a PROJECTOR Kft. megb°z†sa alapj†n');
  OutTextxy(koz,14*yk+yd,'KÇsz°tette: Dr. R†cz KornÇlia');
  OutTextxy(koz,17*yk+yn,'Budapest 2001.-2004.');
  ADATCIM; OutTextxy(6*xk-xn,15*yk,'egyetemi adjunktus (BME)');
End; {______________________________________________________________________}
Procedure FOMENU;                              { A program neve Çs a fìmenÅ.}
Begin
  UJLAP; OutTextxy(koz,3*yk,'Program funkci¢k');
  ADATCIM; SetUserCharsize(3,5,4,7); x0:=2*xk+xn; ya:=trunc(35*ey); y0:=6*yn;
  OutTextxy(x0,y0+ya,'Adatok bevitele . . . . . . . . . . . . . . . . . ');
  OutTextxy(x0,y0+ya*2,'Jav°t†s , adatok kiirat†sa  . . . . . . . . . ');
  OutTextxy(x0,y0+ya*3,'Pofa mozg†sp†ly†ja . . . . . . . . . . . . . . ');
  OutTextxy(x0,y0+ya*4,'Technol¢giai jellemzìk . . . . . . . . . . . .');
  OutTextxy(x0,y0+ya*5,'Nyom¢lap t†masz helyÇnek v†ltoztat†sa ');
  OutTextxy(x0,y0+ya*6,'Bemenì adatok mentÇse (FILE-ba) . . . .');
  OutTextxy(x0,y0+ya*7,'VÇge . . . . . . . . . . . . . . . . . . . . . . . . ');
  SetColor(Eszin);
  For i:=1 to 7  do Begin Str(i,j0); OutTextxy(trunc(510*ex),y0+i*ya,j0); End;
  OutTextxy(x0,y0+ya,'A');   OutTextxy(x0,y0+ya*2,'J');
  OutTextxy(x0,y0+ya*3,'P'); OutTextxy(x0,y0+ya*4,'T');
  Outtextxy(x0,y0+ya*5,'N'); Outtextxy(x0,y0+ya*6,'B');
  Outtextxy(x0,y0+ya*7,'V'); SetColor(Aszin); SetUserCharsize(1,2,2,5);
End; {______________________________________________________________________}
Procedure ALAPSZAMIT;                           { Kezdeti ÇrtÇkek felvÇtele }
Begin
  sa1:=sin(al*rad); sb1:=sin(bet*rad); ca1:=cos(al*rad); cb1:=cos(bet*rad);
  ta1:=sa1/ca1; tb1:=sb1/cb1;
End; {______________________________________________________________________}
Procedure ALAPADATOK;                           { Kezdeti ÇrtÇkek felvÇtele }
Begin
  nn:=400; exc:=11; res:=40; B0:=750; al:=11.5; Hm:=1600; Hf:=-110; Lf:=270;
  Hn:=2080; Ln:=100; L0:=345; bet:=15; e0:=22; em:=70; Df:=550; ro:=2.5; w:=14.5;
  a[1]:=nn; a[2]:=exc; a[3]:=res; a[4]:=B0; a[5]:=al; a[6]:=Hm; a[7]:=Hf;
  a[8]:=Lf; a[9]:=Hn; a[10]:=Ln; a[11]:=L0; a[12]:=bet; a[13]:=e0; a[14]:=em;
  a[15]:=1050; a[16]:=2080; a[17]:=-1; a[18]:=15; a[19]:=Df; a[20]:=ro; a[21]:=w;
End; {______________________________________________________________________}
Procedure TOROABRA;                { Kirajzolja a tîrãgÇpet az ABRA unitb¢l.}
Begin
  ALAPSZAMIT; xf0:=4; xa0:=7*xk; yf0:=2*xn; ya0:=11*yk; ra:=2*xd;
  alf:=0; NYILAK;
  SetViewport(xf0,yf0,xa0,ya0,clipon); Clearviewport; LEPTEK; TORORAJZ;
End; {______________________________________________________________________}
Procedure ADATVALASZT;   { Adatbevitel v†laszt†s:'1'-billentyñ,'2'-disc FILE}
Begin
  ADATCIM; yb:=8*yk; xb:=3*xk; SetUserCharsize(5,6,3,5);
  If cimek[1]=''
    Then Begin fa:='1'; End
    Else Begin
           If me=1 Then Begin
             OutTextxy(xb,yb,' Mem¢ri†b¢l  . . . . . . .');
             OutTextxy(xb,yb+2*yk,' Elmentett FILE-b¢l  . . ');
             fa:=' '; SetColor(Eszin);
             OutTextxy(2*xb,yb,   '             1');
             OutTextxy(2*xb,yb+2*yk,'             2');
             Repeat  fa:=readkey; Until ((fa='1') or (fa='2'));
                        End;
             SetViewport(xd,yb-2*yk,getmaxx-xd,getmaxy-yd,clipon);
             ClearViewport;
             If fa='2' Then Begin
                   For i:=1 to 21 do a[i]:=0;
                   me:=0; uj:=2; ADATBEHIVAS; ALAPSZAMIT;
                   SetViewport(xd,4*yk,getmaxx-xd,getmaxy-yd,clipon);
                   ClearViewport;
                            End
                   Else Begin If a[1]=0 Then ALAPADATOK; End; End;
  SetViewport(0,0,getmaxx,getmaxy,clipon);
End; {______________________________________________________________________}
Procedure BEMENOADAT; { Kirajzolja a kiv†lasztott rostatipust,az ABRA unitb¢l.}
Begin
  UJLAP; OutTextxy(koz,yk,'   Bemenì adatok:');
  If ((me=0) or (me=1)) Then ADATVALASZT;
  SetColor(Aszin); SetLineStyle(0,0,1); TOROABRA;
End; {______________________________________________________________________}
Procedure ADAT0;               { A bemenì adatok megnevezÇsÇnek felsorol†sa.}
Begin
  n:=72; If uj=2 Then FILENEVIR; ADATCIM;
  For i:=1 to 14 do
    Begin
      HELY0; SetUserCharSize(1,2,2,5); OutTextxy(x0,y0+i*xn,jel1[i,1]);
      OutTextxy(x0,y0+i*xn,'    ='); SetUserCharSize(1,2,1,3);
      If ((i=5) or (i=12)) Then OutTextxy(x0+2*xd+2*xk,y0+i*xn-q,jel1[i,2])
                           Else OutTextxy(x0,y0+i*xn+q,jel1[i,2]);
    End;
  a[1]:=nn; a[2]:=exc; a[3]:=res; a[4]:=B0;  a[5]:=al; a[6]:=Hm; a[7]:=Hf;
  a[8]:=Lf; a[9]:=Hn; a[10]:=Ln; a[11]:=L0; a[12]:=bet; a[13]:=e0; a[14]:=em;
End; {______________________________________________________________________}
Procedure ADAT1;  { A bemenì adatok jelîlÇsÇnek Çs dimenzi¢inak felsorol†sa.}
Begin                                                       
  xc:=3*xn; SetUserCharSize(1,2,2,5); For i:=1 to 14 do FEKETE; ALAPSZAMIT;
End; {______________________________________________________________________}
Procedure JAVUTASIT01;   { Elvi hib†n†l a szîveg ki°r†shoz a kÇpernyì be†ll.}
Begin
  UJLAP; hiba:=1; SetUserCharSize(1,1,2,3); SetColor(Eszin);
End; {______________________________________________________________________}
Procedure JAVIT;                            { Adatok jav°t†sa Çs elfogad†sa.}
Begin
  yb:=9*yk+xd; xb:=6*xk+xd; MENU0; PIROS;
  Repeat
    Repeat ja:=readkey; Until ( ja in ja_char);
      If ja=(#0) Then ja:=readkey;
      Case ja of
        #13: Begin FEKETE; SORTORLES; End;                            {ENTER}
        #80,'P': Begin                                             {nyil le}
                   SORTORLES;
                   If hiba=1
                     Then Begin Repeat be:=readkey; Until (be in be_char); End
                     Else Begin FEKETE; If i=14 Then i:=1 Else i:=i+1; End; PIROS;
                 End;
        #72,'H': Begin                                            {nyil fel}
                   SORTORLES;
                   If hiba=1
                     Then Begin Repeat be:=readkey; Until (be in be_char); End
                     Else Begin FEKETE; If i=1 Then i:=14 Else i:=i-1; End; PIROS;
                End;
       'A','a': Begin                                {Ar†nyos †bra rajzol†sa}
                  FEKETE; SetViewport(0,0,getmaxx,getmaxy,clipon);
                  TOROABRA; yb:=9*yk+xd; xb:=6*xk+xd; xc:=3*xn;
                  SetViewport(0,0,getmaxx,getmaxy,clipon);
                  MENU0; ADATCIM; PIROS;
                End;
       #27    : Begin PIROS; color:=succ(getcolor); End;             { ESC }
       Else     Begin                                             {£j ÇrtÇk}
                   If hiba=1 Then OutTextxy(xj,yj,'Hib†s adat !!!');
                   ada:=ja; uj:=1; ADATTORLES;
                   If i=1  Then Begin a[i]:=nn;   NNVIZSG;   End;
                   If i=2  Then Begin a[i]:=exc;  EXCVIZSG;  End;
                   If i=3  Then Begin a[i]:=res;  RESVIZSG;  End;
                   If i=4  Then Begin a[i]:=B0;   B0VIZSG;   End;
                   If i=5  Then Begin a[i]:=al;   ALFAVIZSG; End;
                   If i=6  Then Begin a[i]:=Hm;   MAGASVIZSG;End;
                   If i=7  Then Begin a[i]:=Hf;   HfVIZSG;   End;
                   If i=8  Then Begin a[i]:=Lf;   LfVIZSG;   End;
                   If i=9  Then Begin a[i]:=Hn;   HnVIZSG;   End;
                   If i=10 Then Begin a[i]:=Ln;   LnVIZSG;   End;
                   If i=11 Then Begin a[i]:=L0;   L0VIZSG;   End;
                   If i=12 Then Begin a[i]:=bet;  BETAVIZSG; End;
                   If i=13 Then Begin a[i]:=e0;   E0VIZSG; End;
                   If i=14 Then Begin a[i]:=em;   EMVIZSG; End;
        End;     End;
     Until ((ja=#27) and (hiba=0));
End; {______________________________________________________________________}
{ ************************************************************************* }
Procedure PRINTS;                 { A max. pofa mozg†s ki°r†s†nak form†tuma.}
Begin
  ADATCIM; SetColor(1);  OutTextxy(5*xk,18*yk,'s    =          mm');
  SetuserCharsize(1,2,1,3);  OutTextxy(5*xk,18*yk+q,' max');
  SetuserCharsize(1,2,2,5);  str(smin-smax:5:1,ada);
  OutTextxy(5*xk+4*xn,18*yk,ada); OutTextxy(5*xk+3*xn,18*yk,'2 *');SetColor(Eszin);
  If b[10,0]<0 Then Begin hi:=1; SetuserCharsize(2,3,1,2);
    OutTextxy(4*xk,17*yk,' ôsszeÅtkîznek a pof†k.'); End;
End; {______________________________________________________________________}
Procedure PONTOK;                            {Elmozdul†s a pofa 5 pontj†ban.}
Begin
  For j:=1 to 5 do
    Begin
      ar[i,2*j-1]:=(sr[i,5]-sr[i,7])*(j-1)/4+sr[i,7];
      ar[i,2*j]:=(sr[i,6]-sr[i,8])*(j-1)/4+sr[i,8];
    End;
End; {______________________________________________________________________}
Procedure POFAMOZ;                                  {A pofa mozg†sjellemzãi.}
Begin
  sr[0,1]:=-Ln; sr[0,2]:=-Hn; sr[0,0]:=ta1; sr[0,3]:=-L0*cb1; sr[0,4]:=L0*sb1;
  sr[0,7]:=sr[0,1]-Lf; sr[0,8]:=sr[0,2]+Hf; sr[0,5]:=sr[0,7]-Hm*ta1; sr[0,6]:=sr[0,8]+Hm;
  px:=sr[0,1]; py:=sr[0,2]; a1:=sqrt(sr[0,1]*sr[0,1]+sr[0,2]*sr[0,2]);
  For i:=0 to n do                                           { koordin†t†k}
      Begin
        sr[i,1]:=sr[0,1]+exc*sin(5*i*rad); sr[i,2]:=sr[0,2]-exc*(1-cos(5*i*rad));
        sr[i,7]:=sqrt(sr[i,1]*sr[i,1]+sr[i,2]*sr[i,2]);
        de:=arctan(sr[i,2]/sr[i,1]); If de<0 Then de:=de+pi;
        a2:=(pm*pm-L0*L0-sr[i,7]*sr[i,7])/(-2*L0*sr[i,7]); ep:=Arccos(a2);
        ka:=de-ep; sr[i,3]:=-L0*cos(ka); sr[i,4]:=-L0*sin(ka);
        ka:=arctan((sr[i,1]-sr[i,3])/(sr[i,4]-sr[i,2]));
        sr[i,5]:=sr[i,3]-pa*sin(sa-ka); sr[i,6]:=sr[i,4]-pa*cos(sa-ka);
        sr[i,7]:=sr[i,1]-pf*sin(sf+ka); sr[i,8]:=sr[i,2]+pf*cos(sf+ka);
        sr[i,0]:=(sr[i,7]-sr[i,5])/(sr[i,6]-sr[i,8]);
        PONTOK;
      End;
End; {______________________________________________________________________}
Procedure MAXLOKET;                         { A mozg¢ pofa max. elmozdul†sa.}
Begin
  smax:=sr[0,5]; smin:=sr[0,5];
  For i:=0 to n do
      Begin
        If smax>sr[i,5] Then smax:=sr[i,5]; If smin<sr[i,5] Then smin:=sr[i,5];
      End;
End; {______________________________________________________________________}
Procedure SZAMIT;            {A pofa, Çs a szerkezet mozg†s†nak koordin†t†i.}
Begin
  ALAPSZAMIT;
  po:=Hm/ca1; pf:=sqrt(Hf*Hf+Lf*Lf);           {po-pofa hossz,pf-felsã hossz}
  If Hf=0 Then de:=pi/2 Else de:=arctan(Lf/Hf); If Lf=0 Then de:=0;
  If de<0 Then de:=pi+de;
  a1:=Hn+L0*sb1; a2:=L0*cb1-Ln; pm:=sqrt(a1*a1+a2*a2);  
  ka:=arctan(a2/a1); If a2=0 Then ka:=0;             {pofa h†ts¢ hajl†sszîge}
  sf:=de-ka; a1:=a1-Hf-Hm; a2:=Hm*ta1-a2+Lf; pa:=sqrt(a1*a1+a2*a2);
  om:=arctan((Lf+Hm*ta1)/(Hm+Hf));
  pr:=sqrt((Hm+Hf)*(Hm+Hf)+(Lf+Hm*ta1)*(Lf+Hm*ta1));  {pr-†tl¢,pa-als¢ hossz}
  If a1=0 Then de:=pi/2 Else de:=arctan(a2/a1); If de<0 Then de:=pi+de;
  sa:=ka+de; POFAMOZ; MAXLOKET;                 {sf,sa-felso, also pofa szog}
  loket:=smin-smax; If r=11 Then res0:=res-2*(sr[0,5]-smin);
  garat:=res+2*Hm*ta1; any:=trunc(0.8*garat);
  If me=5 Then Begin
                 p[4,k+i0*5]:=2*loket; res:=res0+2*(sr[0,5]-smin);
                 p[3,k+i0*5]:=res-2*(sr[0,5]-smax);
                 If p[3,1]<0 Then hi:=1; p[12,k+i0*5]:=res;
               End                   {p[4]-îsszlîket, 3-min.rÇs, 12-nÇvl.res}
          Else Begin
                 b[10,r]:=res-2*(sr[0,5]-smax);
                 If b[10,1]<0.0 Then Begin r:=9; hi:=1; End;
                 b[11,r]:=res-2*(sr[0,5]-smin);
                 b[9,r]:=2*loket; b[19,r]:=garat;
               End;           {b[9]-îsszlîket,10-min.rÇs,11-max.rÇs,19-garat}
End; {______________________________________________________________________}
Procedure TAMASZ;                                  { Nyom¢lap megt†maszt†sa.}
Begin
  SetLineStyle(0,0,3); Line(x+xb,y-yn,x+xb,y+yn); SetLineStyle(0,0,1);
  Circle(x,y,r0); SetFillStyle(3,Aszin); Bar(x+xb,y-yn,x+xb+xt,y+yn);
End; {______________________________________________________________________}
Procedure SZERKEZET;                              { A szerkezet †ll¢ rÇszei.}
Begin
  x:=x0+3*r0; y:=y0; xb:=2*r0; xt:=xd; TAMASZ;
  x:=x0-xp-3*r0; xb:=-2*r0; xt:=-xt; TAMASZ;
End; {______________________________________________________________________}
Procedure POFA0;                                         { Pofa †br†zol†sa. }
Begin
  If ((Color=Aszin)or(Color=Hatter)) Then SetLineStyle(0,0,3) Else SetLineStyle(0,0,1);
  po1[1,1]:=si[i,1]; po1[1,2]:=si[i,2]; po1[2,1]:=si[i,3];
  po1[2,2]:=si[i,4]; po1[3,1]:=si[i,5]; po1[3,2]:=si[i,6];
  po1[4,1]:=si[i,7]; po1[4,2]:=si[i,8];
  SetColor(Color); SetFillStyle(0,0); FillPoly(4,po1);
  po1[1,1]:=si[i,9];  po1[2,1]:=si[i,11];
  po1[3,1]:=si[i,13]; po1[4,1]:=si[i,15];
  SetFillStyle(0,Color); FillPoly(4,po1);
  If ((Color=Aszin)or(Color=Hatter)) Then SetLineStyle(0,0,3) Else SetLineStyle(0,0,1);
  Line(si[i,3]+2*r0,si[i,4],x0+2*r0,y0);
  SetLineStyle(0,0,1); Circle(+r0+si[i,3],si[i,4],r0);
  Circle(si[i,1],si[i,2],r0);
  If ((Color=Aszin)or(Color=Hatter)) Then SetLineStyle(0,0,3) Else SetLineStyle(0,0,1);
  Line(si[i,11]-2*r0,si[i,12],x0-xp-2*r0,y0);
  SetLineStyle(0,0,1); Circle(-r0+si[i,11],si[i,12],r0);
  Circle(si[i,9],si[i,10],r0);
End; {______________________________________________________________________}
Procedure TORO;                              { TîrãgÇp rajz - kÇpernyã †bra.}
Begin
  For i:=0 to n do For j:=1 to 4 do
     Begin si[i,2*j-1]:=x0+trunc(sr[i,2*j-1]*el);
           si[i,2*j]:=y0+trunc(sr[i,2*j]*el); End;
  For i:=0 to n do For j:=9 to 12 do
     Begin si[i,2*j-9]:=x0-xp-trunc(sr[i,2*j-17]*el);
           si[i,2*j-8]:=y0+trunc(sr[i,2*j-16]*el); End;
End; {______________________________________________________________________}
Procedure VALTAS;                                   { TîrÇs, År°tÇs v†lt†sa }
Begin
  For i:=1 to 5 do For j:=1 to 2 do hat[i,j]:=0;
  For i:=1 to 5 do For j:=1 to 3 do ert[i,j]:=0;
  For i:=1 to n do For j:=1 to 5 do
    Begin ar[i,2*j-1]:=ar[0,2*j-1]-ar[i,2*j-1];
          ar[i,2*j]:=ar[0,2*j]-ar[i,2*j];       End;
  For j:=1 to 5 do Begin ar[0,2*j-1]:=0; ar[0,2*j]:=ar[n,2*j]; End;
  smin:=0; smax:=0;
  For j:=1 to 5 do
    For i:=0 to n do
      Begin
        If ert[j,1]<ar[i,2*j-1]
          Then Begin ert[j,1]:=ar[i,2*j-1]; hat[j,1]:=i; End;
        If ert[j,2]>ar[i,2*j-1]
          Then Begin ert[j,2]:=ar[i,2*j-1]; hat[j,2]:=i; End;
      End;
  For j:=1 to 5 do
      Begin
        If smax<ert[j,1] Then smax:=ert[j,1];
        If smin>ert[j,2] Then smin:=ert[j,2];
      End;
  vy:=(ar[hat[5,1],10]-ar[hat[5,1]+1,10])/(60/nn/n);
  If me=5 Then p[2,k+i0*5]:=vy Else b[8,r]:=vy;                        {mm/s}
End; {______________________________________________________________________}
Procedure X_T;                                      { V°zszintes elmozdul†s }
Begin
  UJLAP; If uj=2 Then FILENEVIR; SetUserCharsize(2,3,1,2);
  OutTextxy(koz,yn,'A pofa "x" ir†ny£ elmozdul†sa'); ADATCIM;
  OutTextxy(4*xk,2*yn,' ( a nÇvleges rÇsny°l†sn†l )'); VALTAS;
  a1:=smax-smin; el:=300*ey/a1; yy:=trunc(smin*el); y:=trunc(smax*el);
  y0:=3*yk+3*yd+y; x0:=3*xk-xd; SetColor(Aszin);
  Line(x0-xd,y0,x0+6*n+xn,y0); MoveTo(x0+6*n+xn,y0); NYILJ;
  xbe:=x0+6*n+2*xd; ybe:=y0-3*xd; betu:=fi; GOROGB;                      {fi}
  OutTextxy(x0+6*n+xd,y0+q,'[FOK]');
  Line(x0,y0-y-xn,x0,y0-yy+yn); MoveTo(x0,y0-y-xn); NYILF;
  OutTextxy(x0-xn-4,y0+yy-2*yn,'+x');
  MoveTo(x0,y0-yy+yn); NYILL; OutTextxy(x0-xn-4,y0-yy+2*yd,'-x');
  OutTextxy(xn,3*yk+q,'JelîlÇs:');
  SetLineStyle(1,0,1); For i:=1 to 12 do Line(x0+36*i,y0-y,x0+36*i,y0-yy);
  SetLineStyle(0,0,1); For i:=1 to 4 do Line(x0+108*i,y0-y,x0+108*i,y0-yy);
  SetLineStyle(0,0,3);
  For j:=1 to 5 do
    Begin
      MoveTo(x0,y0); SetColor(szi[j]);
      For i:=1 to n do
        Begin
          If ar[i-1,2*j-1]>ar[i,2*j-1]
            Then SetLineStyle(0,0,1) Else SetLineStyle(0,0,3);
          LineTo(x0+6*i,y0-trunc(ar[i,2*j-1]*el));
          If ((i=hat[j,1]) or (i=hat[j,2])) Then Begin
            SetLineStyle(0,0,1); Circle(x0+6*i,y0-trunc(ar[i,2*j-1]*el),r0); End;
    End; End;
  ABRAJELOL; MENUHOZ;
End; {______________________________________________________________________}
{ ************************************************************************* }
Procedure MOZGPALYA;                          { M O Z G . J E L L . A B R A }
Begin
  UJLAP; If uj=2 Then FILENEVIR; me:=3; SetUserCharsize(2,3,1,2);
  OutTextxy(koz,yn,'A pofa mozg†sp†ly†ja');
  ADATCIM; OutTextxy(4*xk,2*yn,'  ( a nÇvleges rÇsny°l†sn†l )');
  For i:=1 to 19 do Begin For j:=0 to 10 do b[i,j]:=0; End;
  SetUserCharsize(1,2,2,5); r:=0; SZAMIT; LEPTEK0;
  TORO; SetColor(Aszin); i:=0; SZERKEZET; Color:=Aszin; POFA0;   {szerk.†bra}
  i:=18; Color:=9; POFA0; i:=36; Color:=3; POFA0; i:=54; Color:=12; POFA0;
  TENGELY;
  For j:= 1 to 5 do
    OutTextxy(x0-xn+j+trunc(ar[0,2*j-1]*el),y0-yd-q+trunc(ar[0,2*j]*el),tex[j]);
  x:=x0+2*(getmaxx-x0-xn) div 3; y:=3*yk+2*yn; yy:=4*yn;
  For j:= 1 to 5 do OutTextxy(x-xk-xn,y-2*yn+(j-1)*yy,tex[j]);
  For j:=1 to 5 do
    Begin
      a1:=ar[0,2*j-1]; a2:=ar[0,2*j]; MoveTo(x,y+(j-1)*yy);
      SetColor(Eszin); SetLineStyle(0,0,1);
      For i:=1 to n do
        Begin
          ai[i,2*j-1]:=x-trunc((a1-ar[i,2*j-1])*ee);
          ai[i,2*j]:=y+(j-1)*yy-trunc((a2-ar[i,2*j])*ee);
          LineTo(ai[i,2*j-1],ai[i,2*j]);
        End;
      ADATCIM; SetUserCharsize(1,3,2,5);
      If ai[18,2*j-1]>ai[54,2*j-1] Then k:=0 Else k:=-1; SORREND;
    End;
  PRINTS;                                                      {smax ki°r†sa}
End; {______________________________________________________________________}
{ ************************************************************************* }
Procedure ADAT4;               { A bemenì adatok megnevezÇsÇnek felsorol†sa.}
Begin
  OutTextxy(xk,y0,     'A feladott anyag max. mÇrete:  . . . . . . . .');
  OutTextxy(xk,y0+yk,  'A feladott anyag sñrñsÇge (tîmîr):  . . . . . .');
  OutTextxy(xk,y0+2*yk,'Fajlagos energia-index (Bond-fÇle):  . . . . . .');
  OutTextxy(x0,y0+2*yk,' w '); OutTextxy(x0,y0,'D ');
  xbe:=x0+2*xd; ybe:=y0+yk; betu:=rob; GOROGB;
  SetUserCharSize(1,2,1,3); OutTextxy(x0,y0+q,'  fel ');
  OutTextxy(x0+3*xk,y0+yk-q,'   3'); SetUserCharSize(1,2,2,5);
  For i:=1 to 3 do OutTextxy(x0,y0+(i-1)*yk,'     =');
  OutTextxy(x0+2*xk,y0,'     mm'); OutTextxy(x0+2*xk,y0+yk,'     t/m');
  OutTextxy(x0+2*xk,y0+2*yk,'    kW¢/t');
  xa:=xn+2*yk; a[19]:=Df; a[20]:=ro; a[21]:=w;
  str(a[19]:6:1,ada); OutTextxy(x0+xa,y0,ada);
  str(a[20]:6:2,ada); OutTextxy(x0+xa,y0+yk,ada);
  str(a[21]:6:2,ada); OutTextxy(x0+xa,y0+2*yk,ada);
End; {______________________________________________________________________}
Procedure JAVIT2;                           { Adatok jav°t†sa Çs elfogad†sa.}
Begin
  xb:=6*xk+xd; yb:=y0-yk-q; MENU0; PIROS;
  Repeat
    Repeat ja:=readkey; Until (ja in ja_char);
      If ja=(#0) Then ja:=readkey;
      Case ja of
        #13: Begin FEKETE; SORTORLES; End;                            {ENTER}
        #80,'P': Begin                                              {nyil le}
                   SORTORLES;
                   If hiba=1
                     Then Begin Repeat be:=readkey; Until (be in be_char); End
                     Else Begin FEKETE; If i=21 Then i:=19 Else i:=i+1; End; PIROS;
                 End;
        #72,'H': Begin                                             {nyil fel}
                   SORTORLES;
                   If hiba=1
                     Then Begin Repeat be:=readkey; Until (be in be_char); End
                     Else Begin FEKETE; If i=19 Then i:=21 Else i:=i-1; End; PIROS;
                End;
       #27    : Begin PIROS; color:=succ(getcolor); End;              { ESC }
       Else     Begin                                              {£j ÇrtÇk}
                   If hiba=1 Then OutTextxy(xj,yj,'Hib†s adat !!!');
                   ada:=ja; uj:=1; ADATTORLES;
                   If i=19 Then Begin a[i]:=Df;  DFVIZSG;  End;
                   If i=20 Then Begin a[i]:=ro;  ROVIZSG;   End;
                   If i=21 Then Begin a[i]:=w;   WVIZSG;   End;
       End;     End;
     Until ((ja=#27) and (hiba=0));
End; {______________________________________________________________________}
Procedure EROSZAM;                       { Az egyes szerkezetekre hat¢ erãk.}
Begin                                                {b[16]-Ft,17-Fny,18-Fcs}
  a1:=0.8*(ert[4,1]-ert[4,2])+0.2*(ert[3,1]-ert[3,2]);     {a1-s0 0,3*Hm-nÇl}
  b[16,r]:=b[13,r]*b[15,r]*60/nn/a1/2*ez;                             {16-Ft}
  If ((hat[4,1]>hat[5,1])and(hat[4,1]<hat[5,2]))
                Then i1:=hat[5,1] Else i1:=hat[4,1];
  ka:=sr[i1,0]; de:=sr[i1,4]/sr[i1,3];
  a3:=0.7*sr[i1,5]+0.3*sr[i1,7]; a4:=0.7*sr[i1,6]+0.3*sr[i1,8];     {Ft koor}
  a1:=(-ka*a3+a4)/(de-ka); a2:=de*a1;
  ka:=arctan(ka); de:=arctan(de); ep:=arctan((sr[i1,2]-a2)/(sr[i1,1]-a1));
  a4:=sin(de)*cos(ep)-sin(ep)*cos(de);
  b[18,r]:=b[16,r]*(sin(de)*cos(ka)-sin(ka)*cos(de))/a4;       {pofa bekîtÇs}
  b[17,r]:=(b[16,r]*cos(ka)-b[18,r]*cos(ep))/cos(de);            {1.nyom¢lap}
  fr[1,0]:=ka; fr[2,0]:=pi+de; fr[3,0]:=pi+ep;
  For i:=1 to 3 do
    Begin If b[15+i,r]<0 Then Begin b[15+i,r]:=-b[15+i,r]; fr[i,0]:=fr[i,0]+pi; End;
          fr[i,1]:=b[i+15,r]*cos(fr[i,0]); fr[i,2]:=b[i+15,r]*sin(fr[i,0]); End;
End; {______________________________________________________________________}
Procedure PQv1;                                      { P, Q Çs v1 sz†mit†sa }
Begin                            {b[1]-res,8-vy,12-Q,13-P,14-v1,15-eta,19-h1}
  SZAMIT; VALTAS; res:=res;
  h1:=loket/sr[hat[5,2],0];                              {h1-prizma magass†g}
  db:=hat[5,2]-(hat[4,1]+hat[5,1])/2;
  If db<0 Then db:=72+db;                                      {db-cikl.sz†m}
  laz:=1.0; kv:=1.0; dt:=60/nn; tu:=1.2*dt/n*db;       {dt-T, tu-ÅritÇsi idã}
  a1:=3600*a[4]/ez/ez/ez*ro*0.6; a2:=w/90.7;       {a1-Qn const, a2-Pn const}
  eta:=0.7; a4:=0.8*Df/ez; vn:=h1/tu; vk:=vn*0.9/2;
  If me=4 Then smin:=b[10,r] Else smin:=p[3,k+i0*5]; smax:=smin+2*loket;
  If vy<vn
    Then Begin h2:=h1-1/2*(vn-vy)*tu/1.5; If h2<=2.0 Then h2:=h1/3;
               laz:=h2/h1; dv:=(vn-vy)/2;
               v1:=(vn+dv)*0.9/2; eta:=eta-0.3*(v1-vk)/v1;
               a3:=(2*smin+(smax-smin)*laz)/2; 
               If vy<vn*0.75 Then Begin o:=1; p[13,k+i0*5]:=1; End; End
    Else Begin a3:=(smin+smax)/2; v1:=vk; p[13,k+i0*5]:=0; o:=0; End;
  If v1>vme Then Begin v0:=vme/ez; kv:=vme/v1; End Else v0:=v1/ez;
  Qn:=kv*a1*laz*a3*vk; If Qn<0 Then Qn:=0.0;
  Pn:=a2*Qn*(1/sqrt(0.8*a3/ez)-1/sqrt(a4))/eta;
  If me=4 Then Begin b[12,r]:=Qn; b[13,r]:=Pn; b[14,r]:=v0; b[15,r]:=eta; End
          Else Begin p[5,k+i0*5]:=Qn; p[6,k+i0*5]:=Pn; p[7,k+i0*5]:=v0;
                     p[12,k+i0*5]:=res; If Pn>0 Then p[11,k+i0*5]:=Qn/Pn;
                     If v1>vme Then Begin p[13,k+i0*5]:=2; End;
                     End;
  If r>0 Then EROSZAM;
End; {______________________________________________________________________}
Procedure QPresDIAGR;                               { Diagramok leptekezese }
Begin
  Qmax:=b[12,0]; Pmax:=b[13,0]; vmax:=b[14,0];
  For r:=1 to 9 do Begin
    If b[12,r]>Qmax Then Qmax:=b[12,r]; If b[13,r]>Pmax Then Pmax:=b[13,r];
    If b[14,r]>vmax Then vmax:=b[14,r]; End;
  x0:=4*xk; y0:=17*yk+yd;
  b[12,10]:=160*ey/Qmax; b[13,10]:=130*ey/Pmax; b[14,10]:=100*ey/vmax;
  y:=160; ADATCIM;  SetColor(Aszin);
  Line(x0,y0,x0+17*yk,y0); MoveTo(x0+17*yk,y0); NYILJ;
  OutTextxy(x0+12*xn,y0+yk-q,' rÇsnyil†s [ mm ]');
  Line(x0,y0,x0,y0-y-yd); MoveTo(x0,y0-y-yd); NYILF;
  OutTextxy(x0-4*xn,y0-y-yn-3,'Q ,P ,v');
  OutTextxy(2*xn,11*yk+q,'JelîlÇs:');
  SetColor(szi[1]); SetLineStyle(0,0,3); Line(xn,13*yk,3*xn,13*yk);
  SetColor(Aszin); OutTextxy(4*xn,13*yk-yd,'Q  t/¢');
  SetColor(szi[2]); Line(xn,14*yk,3*xn,14*yk); SetColor(Aszin);
  OutTextxy(4*xn,14*yk-yd,'P  kW');
  SetColor(Eszin); Line(xn,15*yk,3*xn,15*yk);
  If vmax*ez>vme Then Begin SetLineStyle(0,0,1); Line(xn,16*yk,3*xn,16*yk);
        OutTextxy(4*xn,16*yk-yd,'v > 0.4 m/s');
        OutTextxy(5*xk,12*yn+yd+q,'     T£l nagy a kapar¢l†nc sebessÇge.'); End;
  If o=1 Then Begin SetColor(Eszin);
        OutTextxy(4*xk,12*yn+yd+3,'   T£l kicsi a pofa mozg†s "År°tÇsi sebessÇge".'); End;
  SetColor(Aszin); OutTextxy(4*xn,15*yk-yd,'v  m/s');
  SetLineStyle(1,0,1); SetTextStyle(0,0,1); SetColor(Aszin);
  For r:=1 to 9 do
    Begin
      Line(x0+(r-1)*xk,y0,x0+(r-1)*xk,y0-y); str(trunc(b[1,r]):4,ada);
      OutTextxy(x0-xn+(r-1)*xk,y0+yd,ada);
    End;
  SetLineStyle(0,0,3);
  For k:=12 to 14 do                                              {diagramok}
    Begin
      yy:=trunc(b[k,1]*b[k,10]); MoveTo(x0,y0-yy); SetColor(szi[k-11]);
      For r:=1 to 9 do Begin If ((k=14) and (b[k,r]*ez>vme)) Then
         SetLineStyle(0,0,1) Else SetLineStyle(0,0,3);;
         LineTo(x0+(r-1)*xk,y0-trunc(b[k,r]*b[k,10]));    End;
    End;
  SetLineStyle(0,0,1); xx:=trunc((res-e0)/(em-e0)*8*xk);
  For k:=12 to 14 do                                        {nÇvleges rÇshez}
    Begin SetColor(szi[k-11]); yy:=trunc(b[k,0]*b[k,10]);
          Line(x0+xx,y0,x0+xx,y0-yy); Line(x0+xx,y0-yy,x0-q,y0-yy);
          If k=14 Then str(b[k,0]:5:3,ada) Else str(b[k,0]:5:1,ada);
          OutTextxy(x0-xd-2*xn,y0-3-yy,ada);    End;
  SetColor(Aszin);
End; {______________________________________________________________________}
Procedure RESGeom;                      { A rÇsv†loztat†s geometriai hat†sa }
Begin
  a2:=(pr*sin(om)+(res-e0)/2); a3:=sqrt(pr*pr-a2*a2); dom:=arctan(a2/a3)-om;
  om:=arctan(a2/a3); If Hf=0 Then de:=pi/2 Else de:=arctan(Lf/Hf);
  If de<0 Then de:=pi+de; b[4,1]:=pf*cos(de+dom); b[5,1]:=pf*sin(de+dom);
  b[3,1]:=a3-b[4,1]; b[2,1]:=arctan((a2-b[5,1])/b[3,1])/rad;
  a3:=pm*sin(ka+dom); a4:=sqrt(pm*pm-a3*a3)-Hn; a5:=sqrt(L0*L0-a4*a4);
  b[6,1]:=a5-a3; b[7,1]:=arctan(a4/a5)/rad; de:=de+dom; ka:=ka+dom;
  For r:=2 to 9 do Begin
    a2:=a2-a1; a3:=sqrt(pr*pr-a2*a2); dom:=om-arctan(a2/a3);
    om:=arctan(a2/a3); b[4,r]:=pf*cos(de-dom); b[5,r]:=pf*sin(de-dom);
    b[3,r]:=a3-b[4,r]; b[2,r]:=arctan((a2-b[5,r])/b[3,r])/rad;
    a3:=pm*sin(ka-dom); a4:=sqrt(pm*pm-a3*a3)-Hn; a5:=sqrt(L0*L0-a4*a4);
    b[6,r]:=a5-a3; b[7,r]:=arctan(a4/a5)/rad; de:=de-dom; ka:=ka-dom;  End;
End; {______________________________________________________________________}
Procedure RESVALT;                         { A rÇsnyil†s v†ltoztat†s hat†sa }
Begin
  For r:=1 to 9 do Begin
     res:=b[1,r]; al:=b[2,r]; Hm:=b[3,r]; Hf:=b[4,r]; Lf:=b[5,r];
     Ln:=b[6,r]; bet:=b[7,r]; PQv1;   End;
  res:=a[3]; al:=a[5]; Hm:=a[6]; Hf:=a[7]; Lf:=a[8]; Ln:=a[10]; bet:=a[12];
End; {______________________________________________________________________}
Procedure TABLAZAT1;                                 { EredmÇnyek t†bl†zata }
Begin
  xt:=4*xn-q; xx:=8*xk-4*xd; yt:=3*yk; xa:=xk+xd; ADATCIM;
  Rectangle(xt,yt-yk,xt+2*xa+xx,yt+8*yn+q);
  Rectangle(xt-2,yt-yk-2,xt+2*xa+xx+2,yt+8*yn+q+2);
  Line(xt,yt,xt+xx+2*xa,yt); Line(xt+xx,yt-yk,xt+xx,yt+8*yn+q);
  Line(xt+xx+xa,yt-yk,xt+xx+xa,yt+yn); Line(xt+xx+xa,yt+2*yn+q,xt+xx+xa,yt+8*yn+q);
  OutTextxy(4*xn,y0-q,  '   RÇsny°l†s tartom†ny ( mm )');
  OutTextxy(4*xn,y0+yn,  'A tîrìgÇp garat†nak szÇlessÇge ( S , mm )');
  OutTextxy(4*xn,y0+2*yn,'Feladott anyag max. mÇrete ( D   , mm )');
  OutTextxy(4*xn,y0+3*yn,'Pof†k îsszlîkete ( s , mm )');
  OutTextxy(4*xn,y0+4*yn,'Pof†k t†vols†ga  - min. ( e    , mm )');
  OutTextxy(4*xn-3,y0+5*yn,'                 - max. ( e    , mm )');
  OutTextxy(4*xn,y0+6*yn,'ElmÇleti teljes°tìkÇpessÇg ( Q  , t/¢ )');
  OutTextxy(4*xn,y0+7*yn,'NÇvleges motor teljes°tmÇny ( P  , kW )');
  OutTextxy(4*xn,y0+8*yn,'L†ncp†lya sebessÇge ( v  , m/s )');
  x0:=5*xk; SetUserCharSize(2,5,1,3); OutTextxy(x0+xk+xn,y0+2*yn+q,'  fel');
  OutTextxy(x0+xk,y0+4*yn+q,'min');      OutTextxy(x0+xk,y0+5*yn+q,'max');
  OutTextxy(x0+3*xn+3,y0+6*yn+q,'e');    OutTextxy(x0+4*xn+3,y0+7*yn+q,'n');
  OutTextxy(x0,y0+8*yn+q,'   l'); ADATCIM; str(e0:6:1,ada);           {e0,em}
  OutTextxy(xt+xx,y0-q,ada); str(em:6:1,ada); OutTextxy(xt+xx+xa,y0-q,ada);
  str(b[19,1]:6:1,ada); OutTextxy(xt+xx,y0+yn,ada);         {Feladhat¢ anyag}
  str(b[19,9]:6:1,ada); OutTextxy(xt+xx+xa,y0+yn,ada);
  str(Df:6:1,ada); OutTextxy(xt+xx+xn+xd,y0+2*yn,ada);
  For i:=9 to 14 do
    Begin
      r:=1; If i=14 Then str(b[i,r]:6:3,ada) Else str(b[i,r]:6:1,ada);
      If ((i=10) and (b[i,r]<=0)) Then Begin SetColor(Eszin); hi:=1;
           OutTextxy(6*xk,y0+9*yn+yd,'A pof†k îsszeÅtkîznek.');  End;
      OutTextxy(xt+xx,y0+yn*(i-6),ada); SetColor(Aszin);
      r:=9; If i=14 Then str(b[i,r]:6:3,ada) Else str(b[i,r]:6:1,ada);
      OutTextxy(xt+xx+xa,y0+yn*(i-6),ada);
    End;
End; {______________________________________________________________________}
Procedure TABLAZAT2;                                       { Erãk t†bl†zata }
Begin
  xt:=6*xn-q; xx:=6*xk; yt:=3*yk+yd; xa:=xk+xd; y0:=3*yn+yd; ADATCIM;
  Rectangle(xt,yt-yk,xt+2*xa+xx,yt+3*yn+q);
  Rectangle(xt-2,yt-yk-2,xt+2*xa+xx+2,yt+3*yn+q+2);
  Line(xt,yt,xt+xx+2*xa,yt); Line(xt+xx,yt-yk,xt+xx,yt+3*yn+q);
  Line(xt+xx+xa,yt-yk,xt+xx+xa,yt+3*yn+q);
  OutTextxy(6*xn,y0-q,   '   RÇsny°l†s tartom†ny ( mm )');
  OutTextxy(6*xn,y0+xn,  'Tîrìerì eredìje ( F  ,kN )');
  OutTextxy(6*xn,y0+2*xn,'Nyom¢lapra hat¢ erì ( F  ,kN )');
  OutTextxy(6*xn,y0+3*xn,'Tengelyre hat¢ erì ( F   ,kN )');
  x0:=5*xk; SetUserCharSize(2,5,1,3);
  OutTextxy(x0,y0+yn+q,'    t'); OutTextxy(x0+xk+q,y0+2*yn+q,' n');
  OutTextxy(x0+xk-q,y0+3*yn+q,'cs'); ADATCIM; str(e0:6:1,ada);        {e0,em}
  OutTextxy(xt+xx,y0-q,ada); str(em:6:1,ada); OutTextxy(xt+xx+xa,y0-q,ada);
  For i:=16 to 18 do
    Begin
      r:=1; str(b[i,r]:6:1,ada); SetColor(szi[i-15]); OutTextxy(xt+xx,y0+yn*(i-15),ada);
      r:=9; str(b[i,r]:6:1,ada); SetColor(szi[i-15]); OutTextxy(xt+xx+xa,y0+yn*(i-15),ada);
    End;
End; {______________________________________________________________________}
Procedure EREDfile;                                    { EredmÇnyek FILE-ba }
Begin
  res:=a[3]; al:=a[5]; Hm:=a[6]; Hf:=a[7]; Lf:=a[8]; Ln:=a[10]; bet:=a[12];
  r:=0; SZAMIT; VALTAS; xb:=4*xk+yk; yb:=16*yk+xd;
  SetViewport(xb,yb,getmaxx-xd,yb+2*yk+xd,clipon); ClearViewport;
  FILENEVE; EredFILEPRINT;                         {eredmÇnyek FILE-ba ir†sa}
End; {______________________________________________________________________}
{ ************************************************************************* }
Procedure TECHADATOK;                       { Technol¢giai adatok sz†m°t†sa.}
Begin
  UJLAP; If uj=2 Then FILENEVIR; OutTextxy(koz,yn,'Bemenì adatok');
  me:=4; o:=0; hi:=0; For i:=1 to 19 do For j:=0 to 10 do b[i,j]:=0;
  ADATCIM; x0:=8*xk; y0:=12*yn; ADAT4; adatok:=1;
  i:=19; JAVIT2; UJLAP; If uj=2 Then FILENEVIR;
  OutTextxy(koz,yn,'Technol¢giai adatok'); r:=0; ADATCIM; y0:=3*yn;
  b[1,r]:=res; b[2,r]:=al; b[3,r]:=Hm; b[4,r]:=Hf; b[5,r]:=Lf; b[6,r]:=Ln;
  b[7,r]:=bet; PQv1; a1:=(em-e0)/16;
  For r:=1 to 9 do b[1,r]:=a[13]+(r-1)*2*a1; RESGeom; RESVALT;        {a1-ds}
  If hi=1
    Then Begin SetuserCharsize(2,3,1,2); SetColor(ESzin);
               OutTextxy(2*xk,9*yk,'  Minim†lis rÇsnÇl îsszeÅtkîznek a pof†k.'); MENUHOZ; End
    Else Begin
           TABLAZAT1; QPresDIAGR; TOVABB;
           UJLAP; If uj=2 Then FILENEVIR; SetuserCharsize(2,3,2,3);
           OutTextxy(koz,xn+xd,'Szerkezeti rÇszekre hat¢ erìk');
           TABLAZAT2; VEKTORABRA; FILEba;
           If ((sp='e') or (sp='E')) Then EREDfile; End;
End; {______________________________________________________________________}
{ ************************************************************************* }
Procedure ADAT3;               { A bemenì adatok megnevezÇsÇnek felsorol†sa.}
Begin
  OutTextxy(x0,y0+yk,  'Pofa t†masz helye (hossz-ir†ny) - minimum: . ');
  OutTextxy(x0-3,y0+2*yk,'                                - maximum: .');
  OutTextxy(x0,y0+3*yk,'Nyom¢lap hajl†sszîge - minim†lis:  . . . . . . . . ');
  OutTextxy(x0-5,y0+4*yk,'                      - maxim†lis:  . . . . . . . .');
  x0:=8*xk+xn; OutTextxy(x0,y0+yk,' H'); OutTextxy(x0,y0+2*yk,' H');
  OutTextxy(x0,y0+3*yk,'  ·');  OutTextxy(x0,y0+4*yk,'  ·');
  SetUserCharSize(2,5,1,3);
  OutTextxy(x0+6*xn,y0+3*yk-q,' o'); OutTextxy(x0+6*xn,y0+4*yk-q,' o');
  OutTextxy(x0,y0+yk+q,'    n');     OutTextxy(x0,y0+2*yk+q,'    n');
  SetUserCharSize(1,2,2,5); For i:=1 to 4 do OutTextxy(x0,y0+i*yk,'     =');
  OutTextxy(x0+2*xk,y0+yk,'   mm'); OutTextxy(x0+2*xk,y0+2*yk,'   mm');
  OutTextxy(xn,y0+6*yk,' A pofa t†masz kereszt-ir†ny£ helyzetÇt ( L   ), Çs a nÇvleges rÇsny°l†s £j');
  OutTextxy(xn,y0+7*yk,'    ÇrtÇkÇt ( e ) - a bemenì adatok alapj†n -');
  OutTextxy(7*xk+3,y0+6*yk+q,'  n'); SetColor(Eszin);
  OutTextxy(8*xk,y0+7*yk,'a program sz†mitja ki.');
  SetColor(Aszin); xa:=xn+2*yk;
  For i:=15 to 18 do
    Begin str(a[i]:6:1,ada); OutTextxy(x0+xa-xd+2,y0+yk*(i-14),ada); End;
End; {______________________________________________________________________}
Procedure JAVIT1;                           { Adatok jav°t†sa Çs elfogad†sa.}
Begin
  xb:=6*xk+xd; yb:=y0-yd; MENU0; PIROS;
  Repeat
    Repeat ja:=readkey; Until ( ja in ja_char);
      If ja=(#0) Then ja:=readkey;
      Case ja of
        #13: Begin FEKETE; SORTORLES; End;                            {ENTER}
        #80,'P': Begin                                              {nyil le}
                   SORTORLES;
                   If hiba=1
                     Then Begin
                            Repeat be:=readkey; Until (be in be_char); End
                     Else Begin FEKETE; If i=18 Then i:=15 Else i:=i+1; End; PIROS;
                 End;
        #72,'H': Begin                                             {nyil fel}
                   SORTORLES;
                   If hiba=1
                     Then Begin
                            Repeat be:=readkey; Until (be in be_char); End
                     Else Begin FEKETE; If i=15 Then i:=18 Else i:=i-1; End; PIROS;
                End;
       #27    : Begin PIROS; color:=succ(getcolor); End;              { ESC }
       Else     Begin                                              {£j ÇrtÇk}
                   If hiba=1 Then OutTextxy(xj,yj,'Hib†s adat !!!');
                   ada:=ja; uj:=1; ADATTORLES;
                   If i=15 Then Begin a[i]:=Hn;  HnVIZSG;   End;
                   If i=16 Then Begin a[i]:=Hn;  HnVIZSG;   End;
                   If i=17 Then Begin a[i]:=bet; BETAVIZSG; End;
                   If i=18 Then Begin a[i]:=bet; BETAVIZSG; End;
        End;     End;
     Until ((ja=#27) and (hiba=0));
End; {______________________________________________________________________}
Procedure NYOMOLAP;                        { Nyom¢lap helyÇnek v†ltoztat†sa.}
Begin                                   {p[0]-Hn,1-Ln,3-min.rÇs,4-îsszlîket,}
  u0:=(a[16]-a[15])/8; u1:=(a[18]-a[17])/4;          {u0-Hn, u1-bet lÇpÇskîz}
  u2:=a[15]; u3:=a[17]-u1; k:=1;              {u2-Hn, u3-bet kezdeti ÇrtÇkek}
  For i0:=0 to 8 do
    Begin
      Hn:=u2+i0*u0;                            
      For k:=1 to 5 do
        Begin
          bet:=u3+k*u1; p[k-1,0]:=bet;                                {1-bet}
          sb1:=sin((bet)*rad); cb1:=cos((bet)*rad);
          Ln:=L0*cb1-(Hn+L0*sb1)*sin(ka)/cos(ka); p[1,k+i0*5]:=Ln;     {1-Ln}
          p[0,k+i0*5]:=Hn; r:=0;                                       {0-Hn}
          SZAMIT; VALTAS;                             {4-îsszlîket,3-min.rÇs}
          PQv1;                                              {5-Qn,6-Pn,7-v0}
          a1:=0.8*(ert[4,1]-ert[4,2])+0.2*(ert[3,1]-ert[3,2]);        {a1-s0}
          Ft:=Pn*eta*60/nn/a1/2*ez; p[8,k+i0*5]:=Ft;               {8-F tîrã}
          If ((hat[4,1]>hat[5,1])and(hat[4,1]<hat[5,2]))
                                      Then i1:=hat[5,1] Else i1:=hat[4,1];
          om:=sr[i1,0]; de:=sr[i1,4]/sr[i1,3];
          a3:=0.7*sr[i1,5]+0.3*sr[i1,7]; a4:=0.7*sr[i1,6]+0.3*sr[i1,8];
          a1:=(-om*a3+a4)/(de-om); a2:=de*a1; om:=arctan(om);
          de:=arctan(de); ep:=arctan((sr[i1,2]-a2)/(sr[i1,1]-a1));
          a4:=sin(de)*cos(ep)-sin(ep)*cos(de);
          p[10,k+i0*5]:=Ft*(sin(de)*cos(om)-sin(om)*cos(de))/a4; 
          If p[10,k+i0*5]<0 Then p[10,k+i0*5]:=-p[10,k+i0*5];    {10-F cs†gy}
          p[9,k+i0*5]:=(Ft*cos(om)-p[10,k+i0*5]*cos(ep))/cos(de); {9-F nylap}
    End; End;
End; {______________________________________________________________________}
Procedure TABLAZATOK;                                { EredmÇnyek t†bl†zata }
Begin
  FELIRAT; xt:=2*xn-2; xx:=xk+xd; yt:=8*yk-2*yn; SetUserCharSize(2,3,1,2);
  y0:=yt+6*yk+5*yd; x0:=10*xk;
  If i0=11 Then OutTextxy(koz,3*yk+q,'(              )') Else
    OutTextxy(koz,3*yk+q,'(          )'); OutTextxy(koz,3*yk+q,st3); ADATCIM;
  OutTextxy(koz-3*xd,3*yk+q+4,st2);  OutTextxy(xt+xx+9*xk,yt-yn-q,'  Sor');
  OutTextxy(xt+xx+4*xk,yt-yk-yn,'H  [mm]'); OutTextxy(xt+xx+4*xk+2,yt-yk-yn+q,' n');
  OutTextxy(xt,yt-yk-yn,'   ·');  OutTextxy(xt,yt-yn-q,'   o');
  OutTextxy(xt,yt-yn-2,'  [   ]'); OutTextxy(xt,yt+5*yk+q,' Oszlop');
  Rectangle(xt,yt-2*yk,xt+10*xk+xx,yt+6*yk);
  Rectangle(xt-3,yt-2*yk-2,xt+10*xk+xx+3,yt+6*yk+2);
  Line(xt+xx,yt-2*yk,xt+xx,yt-yk); Line(xt+xx,yt-yk,xt+9*xk+xx,yt-yk);
  Line(xt+xx-2,yt-2*yk,xt+xx-2,yt+6*yk); Line(xt,yt-2,xt+10*xk+xx,yt-2);
  Line(xt,yt+5*yk,xt+10*xk+xx,yt+5*yk); Line(xt,yt+5*yk+2,xt+10*xk+xx,yt+5*yk+2);
  Line(xt+9*xk+xx,yt-2*yk,xt+9*xk+xx,yt+6*yk);
  Line(xt+9*xk+xx+2,yt-2*yk,xt+9*xk+xx+2,yt+6*yk); 
  For i:=0 to 8 do
    Begin
      SetColor(Aszin); Line(xt+xx+i*xk,yt-yk,xt+xx+i*xk,yt+6*yk);
      str(trunc(p[0,1+i*5]):3,ada); OutTextxy(xt+xx+i*xk+xd,yt-yn-2,ada);
      SetColor(Eszin); str(i+1:3,ada); OutTextxy(xt+xx+i*xk+xd,yt+6*yk-yn,ada);
    End;
  For i:=0 to 4 do
    Begin
      SetColor(Aszin); Line(xt,yt+i*yk,xt+10*xk+xx,yt+i*yk);
      str(p[i,0]:5:1,ada); OutTextxy(xt+xd,yt+i*yk+q,ada);
      SetColor(Eszin); str(i+1:3,ada); OutTextxy(xt+xx+9*xk+xd,yt+i*yk+q,ada);
    End;
  For j:=1 to 5 do
    Begin
      For i:=0 to 8 do
        Begin
          SetColor(Aszin); SetTextStyle(0,0,1);
          If ((i0>7)and(i0<11)) Then
            If p[i0,j+5*i]<1000 Then str(p[i0,j+5*i]:5:1,ada) Else str(trunc(p[i0,j+5*i]):4,ada)
                                Else
            If ((i0=7)or(i0=11)) Then str(p[i0,j+5*i]:5:3,ada)
                                 Else If p[i0,j+5*i]<100
                                 Then str(p[i0,j+5*i]:5:2,ada) Else str(p[i0,j+5*i]:5:1,ada);
          If p[13,j+5*i]=0.0 Then SetColor(Aszin) Else
             If p[13,j+5*i]=1.0 Then SetColor(1) Else SetColor(Eszin);
          OutTextxy(xt+xx+i*xk+xd,yt-yn+j*yk+q,ada); ADATCIM;
          If p[13,j+5*i]=2.0 Then Begin SetColor(Eszin);
             OutTextxy(4*xk,y0-yk-yd+yn,'  T£l nagy a l†ncp†lya sebessÇge.'); End;
          If p[13,j+5*i]=1.0 Then Begin SetColor(1);
             OutTextxy(3*xk,y0-yk-yd,'  T£l kicsi a pofa mozg†s "År°tÇsi sebessÇge".'); End;
        End;
    End;
  SetColor(Aszin); ADATCIM; VALASZT2;
  If ((c0='i') or (c0='I'))
    Then Begin
           SetColor(Aszin); OutTextxy(4*xk,y0+2*yn,'A kiv†lasztott adat sor†nak sz†ma : ');
           Repeat ja:=readkey; val(ja,i,m); Until((i>0)and(i<6));
           SetColor(Eszin); OutTextxy(x0,y0+2*yn,ja); uj:=1;
           SetColor(Aszin); OutTextxy(4*xk,y0+3*yn,'A kiv†lasztott adat oszlop†nak sz†ma : ');
           Repeat ja:=readkey; val(ja,j,m); Until((j>0)and(j<10));
           SetColor(Eszin); OutTextxy(x0+xn,y0+3*yn,ja); i0:=(j-1)*5+i;
           a[9]:=p[0,i0]; a[10]:=p[1,i0]; a[3]:=p[12,i0]; a[12]:=p[(i-1),0];
         End;
  TOVABB;
End; {______________________________________________________________________}
{ ************************************************************************* }
Procedure GEOMVALTOZ;             { Geometria adatok v†ltoztat†s†nak hat†sa.}
Begin
  UJLAP; If uj=2 Then FILENEVIR;
  For i:=0 to 13 do For j:=0 to 46 do p[i,j]:=0;
  OutTextxy(koz,2*yk,'Geometriai adatok v†ltoztat†sa');
  me:=5; ADATCIM; y0:=8*yk; x0:=xk; SetUserCharsize(3,5,4,7);
  OutTextxy(xk+xn,y0-yn,  'V†ltoz¢ adatok : ');
  ADATCIM; ADAT3; adatok:=1; i:=15; JAVIT1; bet:=a[12];
  k:=1; i0:=0; r:=11; SZAMIT; r:=1; VALTAS;                {eredeti a[i]-vel}
  If hi=1 Then NODATA            {Ha nem Åtkîznek a pof†k, a Hn v†ltoztat†sa}
          Else Begin NYOMOLAP; di:=0;
                     Repeat Begin MELYIK;
                                  If i0>3 Then If di=0 Then DIAGR1 Else TABLAZATOK; End;
                     Until (c1=' ');
                     Hn:=a[9]; Ln:=a[10]; bet:=a[12]; res:=a[3]; ALAPSZAMIT;
               End;
End; {______________________________________________________________________}
{**************************** F ì p r o g r a m ****************************}

Begin
  ADATDEKL; TESZTEL;                                               {unit-b¢l}
  CIMLAP; MENUHOZ; ClearDevice; NULLAZAS;  SetPalette(7,0);
  Repeat FILEDISCROL(olvasas,'(input)',Err); Until not(Err);
  Repeat
     be_char:=['1','2','3','4','5','6','7','a','j','p','t','n','v'
            ,'g','A','J','P','M','T','B','N','V'];           {MENU v†lasztÇk}
     ja_char:=['+','-',#46,'1','2','3','4','5','6','a','A'
               ,'7','8','9','0',#13,#0,#80,#72,#27];      {JAVITAS v†lasztÇk}
     le_char:=['a','b','c','d','e','A','B','C','D','E'];     {PONT v†lasztÇk}
     c1_char:=['1','2','3','4','5','6','7','8',' ',#27];  {JAVITAS v†lasztÇk}
  ClearViewport; FOMENU;
  Repeat be:=readkey; Until((be in be_char));
  Case be of
      '1','a','A': Begin                            { A D A T B E V I T E L }
                     me:=1; uj:=0; NULLAZAS1; ALAPADATOK;
                     BEMENOADAT; ADAT0; ADAT1;
                     adatok:=1; i:=1; JAVIT; ALAPSZAMIT; hi:=0;
                   End;
      '2','j','J': Begin                    { A D A T O K   J A V å T è S A }
                     If adatok=0 Then NODATA
                       Else Begin
                              me:=2; NULLAZAS1; BEMENOADAT;
                              ADAT0; ADAT1; i:=1; JAVIT; adatok:=1; hi:=0;
                            End;
                   End;
      '3','p','P': Begin                            { M O Z G µ S P µ L Y A }
                     If ((adatok=0) or (hi=1)) Then NODATA
                                 Else Begin MOZGPALYA; MENUHOZ; X_T; End;
                   End;
      '4','t','T': Begin               { T E C H N O L ‡ G I A  A D A T O K }
                     If ((adatok=0) or (hi=1)) Then NODATA
                                 Else Begin TECHADATOK; End;
                   End;
      '5','n','N': Begin                      { Hn  V µ L T O Z T A T µ S A }
                     If ((adatok=0) or (hi=1)) Then NODATA Else GEOMVALTOZ;
                   End;
      '6','b','B': Begin                       { A D A T O K  M E N T ê S E }
                     If adatok=0 Then NODATA
                       Else Begin
                              me:=6; DkeyB:=true; UJLAP;
                              OutTextxy(koz,yk+yd,'Bemenì adatok mentÇse');
                              If inev>=40
                                Then Begin ADATCIM; SetColor(ESzin);
                                  OutTextxy(4*xk,4*yk,'   T£l sok a mentett FILE ! ');
                                  MENUHOZ; End
                                Else Begin
                                  ADATBEHIVAS; MENUHOZ;
                                  Repeat FILEDISCRE(iras,'(output)',Err);
                                  Until Not(Err);
                                  SAVE2; FileNev:=FN; {uj:=2; } End;
                   End;     End;
    End;
  Until (be='7') or (be='v') or (be='V');                         { V ê G E }
CloseGraph;
End .                   { P R O G R A M  V ê G E !!! }
  

{*********************************** E N D  ********************************}
