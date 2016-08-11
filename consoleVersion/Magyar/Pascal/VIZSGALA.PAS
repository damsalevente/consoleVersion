

{
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * *                                                               * * *
* * *                   Pof s k‹t”r‹g‚p mozg sa                     * * *
* * *                            UNIT                               * * *
* * *                                                               * * *
* * *  K‚szlt: a BME p¡t“-‚s Anyagmozgat¢ G‚pek Tansz‚k‚n         * * *
* * *  K‚sz¡tette:dr.R cz Korn‚lia egy.adjunktus                    * * *
* * *                           1997.                               * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
}
   { Ez a  UNIT az adatok ellen“rz‚s‚t tartalmazza. }

Unit VIZSGALA;
Interface
Uses Dos,Crt,Graph,ADAT,SEGED;
  Procedure JAVHIBA;    Procedure SORTORLES;   Procedure ADATTORLES;
  Procedure FEKETE;     Procedure PIROS;       Procedure INPUT;
  Procedure HELY0;      Procedure HELY;        Procedure SZOVEGTORLES;
  Procedure BETAVIZSG;  Procedure L0VIZSG;     Procedure NNVIZSG;
  Procedure EXCVIZSG;   Procedure RESVIZSG;    Procedure B0VIZSG;
  Procedure ALFAVIZSG;  Procedure MAGASVIZSG;  Procedure LfVIZSG;
  Procedure HfVIZSG;    Procedure LnVIZSG;     Procedure HnVIZSG;
  Procedure DFVIZSG;    Procedure ROVIZSG;     Procedure WVIZSG;
  Procedure E0VIZSG;    Procedure EMVIZSG;
Implementation
  {_______________________________________________________________________}
Procedure HELY0;                                          { Az adat helye.}
Begin
  If i>7 Then Begin x0:=7*xk; y0:=10*yk-5*xn+xd; End
         Else Begin x0:=2*xk; y0:=10*yk+2*xn+xd; End;
End; {____________________________________________________________________}
Procedure HELY;                                           { Az adat helye.}
Begin
  If me<3 Then Begin HELY0; xj:=x0+xc-xd; yj:=y0+i*xn; End;
  If me=4 Then Begin xj:=x0+xn+xk; yj:=y0+(i-19)*yk; xc:=3*xn; End;
  If me=5 Then Begin xc:=3*xn; xj:=x0+xc+4; yj:=y0+(i-14)*yk; End;
  SetViewport(xj,yj,xj+xc,yj+yn,clipon);
End; {____________________________________________________________________}
Procedure SORTORLES;             { A hib t kijelz“ sz”veg sor nak t”rl‚se.}
Begin
  SetViewport(xb,yb,getmaxx-xd,yb+yk,clipon);
  SetFillPattern(ures,Aszin);  Bar(0,0,getmaxx-xn,yk); HELY;
End; {____________________________________________________________________}
Procedure SZOVEGTORLES;        { Az adat magyar z¢ sz”veg sor nak t”rl‚se.}
Begin
  SetViewport(6*xn,10*yk+2*xn,getmaxx-xd,11*yk+2*xn,clipon);
  SetFillPattern(ures,Aszin); Bar(0,0,getmaxx-xn,xn+2); HELY;
End; {____________________________________________________________________}
Procedure JAVHIBA;           { A hib s adatbevitel ki¡r sa az almen ut n.}
Begin
  hiba:=1; SetColor(Eszin); SORTORLES; SetViewport(0,0,getmaxx,getmaxy,clipon);
End; {____________________________________________________________________}
Procedure ADATTORLES;                       { Az £j adat hely‚nek t”rl‚se.}
Begin
  SetFillPattern(ures,Aszin); HELY; Bar(0,0,xc,yk);
End; {____________________________________________________________________}
Procedure FEKETE;                             { Adatelfogad s, (ESC) ut n.}
Begin
  If me<3 Then SZOVEGTORLES; SetViewport(0,0,getmaxx,getmaxy,clipon);
  str(a[i]:6:1,ada); If i>19 Then str(a[i]:6:2,ada);
  HELY; ADATTORLES; SetColor(Aszin); Outtextxy(0,0,ada);
End; {____________________________________________________________________}
Procedure PIROS;                                 { ENTER ut ni adatki¡r s.}
Begin
  If me<3 Then SZOVEGTORLES; SetViewport(0,0,getmaxx,getmaxy,clipon);
  If me<3 Then OutTextxy(7*xn,10*yk+2*xn,jel[i]);
  str(a[i]:6:1,ada); If i>19 Then str(a[i]:6:2,ada);
  HELY; ADATTORLES; SetColor(Eszin); Outtextxy(0,0,ada);
End; {____________________________________________________________________}
Procedure INPUT;                   { Adatbevitel,vagy az adatok fell¡r sa}
Begin
  be_char:=['+','-',#46,'1','2','3','4','5','6','7','8','9','0',#8,#13];
  HELY; SetColor(Eszin); OutTextxy(0,0,ada);
  If hiba=1
    Then Begin
           ada:=readkey; ADATTORLES; SORTORLES;
           If((ada=#0) or (ada=#13) or (ada=#27)) Then
             Begin
               JAVHIBA; OutTextxy(xb,yb,'      Hib s adat, jav¡tani kell !');
               ada:=''; SetColor(Eszin);
             End;
         End
    Else ada:=ja;
  SetColor(Eszin); OutTextxy(0,0,ada);
  Repeat
    Repeat be:=readkey; Until (be in be_char);
      Case be of
        #13:Begin
              val(ada,a[i],m); ADATTORLES; str(a[i]:6:1,ada);
              If i>19 Then str(a[i]:6:2,ada);
              SetColor(Eszin); OutTextxy(0,0,ada);
            End;
        #8 :Begin
              Delete(ada,length(ada),1); ADATTORLES; OutTextxy(0,0,ada);
            End;
       Else Begin SORTORLES; ada:=ada+be; OutTextxy(0,0,ada); End;
     End;
  Until (be=#13);
End; {____________________________________________________________________}
Procedure NNVIZSG;                                       { NN V I Z S G }
Begin
  Repeat
    nn:=a[i];  INPUT; nn:=a[i];
    If ((nn>=900) or (nn<=100)) Then
      Begin
        JAVHIBA;
        If nn>=900 Then OutTextxy(xb,yb,'  T£l nagy a fordulatsz m !');
        If nn<=100 Then OutTextxy(xb,yb,'  T£l kicsi a fordulatsz m !');
      End;
  Until ((nn<900) and (nn>100)); hiba:=0;
End; {____________________________________________________________________}
Procedure EXCVIZSG;                                     { E X C V I Z S G }
Begin
  Repeat
    exc:=a[i];  INPUT; exc:=a[i];
    If ((exc>50) or (exc<2)) Then
      Begin
        JAVHIBA;
        If exc>=50 Then OutTextxy(xb,yb,'  T£l nagy az excentricit s !');
        If exc<=2 Then OutTextxy(xb,yb,'  T£l kicsi az excentricit s !');
      End;
  Until ((exc<=50) and (exc>=2)); hiba:=0;
End; {____________________________________________________________________}
Procedure RESVIZSG;                              { N‚vleges r‚s V I Z S G }
Begin
  Repeat
    a1:=a[i];  INPUT; a1:=a[i];
    If ((a1>=200) or (a1<2)) Then
      Begin
        JAVHIBA;
        If a1>=200 Then OutTextxy(xb,yb,'  T£l nagy a megadott m‚ret !');
        If a1<2 Then OutTextxy(xb,yb,'A r‚s m‚rete legal bb 2 mm legyen !');
      End;
  Until ((a1<200) and (a1>=2)); hiba:=0; res:=a1;
End; {____________________________________________________________________}
Procedure e0VIZSG;                                    { Min r‚s V I Z S G }
Begin
  Repeat
    e0:=a[i];  INPUT; e0:=a[i];
    If ((e0>res) or (e0<2)) Then
      Begin
        JAVHIBA;
        If e0>res Then OutTextxy(xb,yb,'A min. r‚s nagyobb a n‚vlegesn‚l !');
        If e0<2 Then OutTextxy(xb,yb,'A min. r‚s legal bb 2 mm legyen !');
      End;
  Until ((e0<=res) and (e0>=2)); hiba:=0;
End; {____________________________________________________________________}
Procedure emVIZSG;                                    { Max r‚s V I Z S G }
Begin
  Repeat
    em:=a[i];  INPUT; em:=a[i];
    If ((em>=200) or (em<e0) or (em<res)) Then
      Begin
        JAVHIBA;
        If em>=200 Then OutTextxy(xb,yb,'  T£l nagy a megadott m‚ret !')
        Else If em<e0 Then OutTextxy(xb,yb,'A max. r‚s kisebb a minim lisn l !')
        Else OutTextxy(xb,yb,'A max. r‚s kisebb a n‚vlegesn‚l !');
      End;
  Until ((em<200) and (em>=e0) and (em>=res)); hiba:=0;
End; {____________________________________________________________________}
Procedure B0VIZSG;                             { Pofa sz‚less‚g V I Z S G }
Begin
  Repeat
    B0:=a[i];  INPUT; B0:=a[i];
    If ((B0>=2500) or (B0<=200)) Then
      Begin
        JAVHIBA;
        If B0>=2500 Then OutTextxy(xb,yb,'  T£l nagy a pofa sz‚less‚g !');
        If B0<=200 Then OutTextxy(xb,yb,'  T£l kicsi a pofa sz‚less‚g !');
      End;
  Until ((B0<2500) and (B0>200)); hiba:=0;
End; {____________________________________________________________________}
Procedure ALFAVIZSG;                                     { ALFA V I Z S G }
Begin
  Repeat
    al:=a[i]; INPUT; al:=a[i];
    If ((al>15) or (al<5)) Then
           Begin
             JAVHIBA;
             If al>15 Then OutTextxy(xb,yb,'   T£l nagy a hajl ssz”g !');
             If al<5 Then OutTextxy(xb,yb, '   T£l kicsi a hajl ssz”g !');
           End;
  Until ((al<=15) and (al>=5)); hiba:=0;
End; {____________________________________________________________________}
Procedure MAGASVIZSG;                           { Pofa magass g V I Z S G }
Begin
  Repeat
    Hm:=a[i]; INPUT; Hm:=a[i];
    If ((Hm>4000) or (Hm<250)) Then
      Begin
        JAVHIBA;
        If Hm>4000 Then OutTextxy(xb,yb,' T£l nagy az mozg¢ pofa magass ga !');
        If Hm<250 Then OutTextxy(xb,yb,' T£l kicsi az mozg¢ pofa magass ga !');
      End;
  Until ((Hm<=4000) and (Hm>=250)); hiba:=0;
End; {____________________________________________________________________}
Procedure HfVIZSG;                                       { Hf V I Z S G }
Begin
  Repeat
    Hf:=a[i]; INPUT; Hf:=a[i];
    If abs(Hf)>Hm*0.2 Then
      Begin
        JAVHIBA;
        If Hf>Hm*0.2 Then OutTextxy(xb,yb,'   T£l nagy az ‚rt‚k !');
        If Hf<Hm*0.2 Then OutTextxy(xb,yb,'   T£l kicsi az ‚rt‚k !');
      End;
  Until abs(Hf)<=Hm*0.2; hiba:=0;
End; {____________________________________________________________________}
Procedure LfVIZSG;                                       { Lf V I Z S G }
Begin
  Repeat
    Lf:=a[i];  INPUT; Lf:=a[i];
    If ((Lf>=0.6*Hm) or (Lf<0.08*Hm)) Then
      Begin
        JAVHIBA;
        If Lf>=0.6*Hm Then OutTextxy(xb,yb,'   T£l nagy a m‚ret !');
        If Lf<0.08*Hm Then OutTextxy(xb,yb,'  T£l kicsi a m‚ret !');
      End;
  Until ((Lf<0.6*Hm) and (Lf>=0.08*Hm)); hiba:=0;
End; {____________________________________________________________________}
Procedure HnVIZSG;                                       { Hn V I Z S G }
Begin
  Repeat
    Hn:=a[i]; INPUT; Hn:=a[i];
    If ((Hn<Hf+Hm/4) or (Hn>Hf+Hm*1.6)) Then
      Begin
        JAVHIBA;
        If Hn>Hf+Hm*1.6 Then OutTextxy(xb,yb,'   T£l nagy az ‚rt‚k !');
        If Hn<Hf+Hm/4 Then OutTextxy(xb,yb,'    T£l kicsi az ‚rt‚k !');
      End;
  Until ((Hn>=Hf+Hm/4) and (Hn<=Hf+Hm*1.6)); hiba:=0;
End; {____________________________________________________________________}
Procedure LnVIZSG;                                       { Ln V I Z S G }
Begin
  Repeat
    Ln:=a[i];  INPUT; Ln:=a[i];
    If ((Ln>=2*Lf) or (Ln<=-100)) Then
      Begin
        JAVHIBA;
        If Ln>=2*Lf Then OutTextxy(xb,yb,'   T£l nagy a m‚ret !');
        If Ln<=-100 Then OutTextxy(xb,yb,'   T£l kicsi a m‚ret !');
      End;
  Until ((Ln<2*Lf) and (Ln>-100)); hiba:=0;
End; {____________________________________________________________________}
Procedure L0VIZSG;                                       { L0 V I Z S G }
Begin
  Repeat
    L0:=a[i];  INPUT; L0:=a[i];
    If ((L0>=1000) or (L0<=80)) Then
      Begin
        JAVHIBA;
        If L0>=1000 Then OutTextxy(xb,yb,'   T£l nagy a m‚ret !');
        If L0<=80 Then OutTextxy(xb,yb,'   T£l kicsi a m‚ret !');
      End;
  Until ((L0<1000) and (L0>80)); hiba:=0;
End; {____________________________________________________________________}
Procedure BETAVIZSG;                                     { BETA V I Z S G }
Begin
  Repeat
    bet:=a[i]; INPUT; bet:=a[i];
    If abs(bet)>40 Then
      Begin
        JAVHIBA;
        If bet>40 Then OutTextxy(xb,yb,'   T£l nagy a hajl ssz”g !');
        If bet<-40 Then OutTextxy(xb,yb,'   T£l kicsi a hajl ssz”g !');
      End;
  Until abs(bet)<=40;  hiba:=0;
End; {____________________________________________________________________}
Procedure DFVIZSG;                                         { Df V I Z S G }
Begin
  Repeat
    Df:=a[i]; INPUT; Df:=a[i]; a1:=res+2*Hm*ta1;
    If ((Df>a1) or (Df<=1.2*res)) Then
      Begin
        JAVHIBA;
        If Df>a1 Then OutTextxy(xb,yb,'Nagyobb, mint a t”r“g‚p garatny¡l sa !');
        If Df<=1.2*res Then OutTextxy(xb,yb,'    T£l kicsi az ‚rt‚k !');
      End;
  Until ((Df<=a1) and (Df>1.2*res)); hiba:=0;
End; {____________________________________________________________________}
Procedure WVIZSG;                                           { W V I Z S G }
Begin
  Repeat
    w:=a[i]; INPUT; w:=a[i];
    If ((w>50.0) or (w<=5.0)) Then
      Begin
        JAVHIBA;
        If w>50.0 Then OutTextxy(xb,yb,'   T£l nagy az ‚rt‚k !');
        If w<=5.0 Then OutTextxy(xb,yb,'   T£l kicsi az ‚rt‚k !');
      End;
  Until ((w<=50.0) and (w>5.0)); hiba:=0;
End; {____________________________________________________________________}
Procedure ROVIZSG;                                    { Sûrûs‚g V I Z S G }
Begin
  Repeat
    ro:=a[i]; INPUT; ro:=a[i];
    If ((ro>=5.0) or (w<=0.8)) Then
      Begin
        JAVHIBA;
        If ro>=5.0 Then OutTextxy(xb,yb,'   T£l nagy az ‚rt‚k !');
        If ro<=0.8 Then OutTextxy(xb,yb,'   T£l kicsi az ‚rt‚k !');
      End;
  Until ((ro<5.0) and (ro>0.8)); hiba:=0;
End; {____________________________________________________________________}

Begin
End.
{********************************** E N D  ******************************}
