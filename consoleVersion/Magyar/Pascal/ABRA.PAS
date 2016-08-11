



{
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * *                                                               * * *
* * *              Fekv‹ DUPLEX t”r‹g‚p m‚retez‚se                  * * *
* * *                         ABRA  UNIT                            * * *
* * *                                                               * * *
* * *  K‚szlt: a BME p¡t“-‚s Anyagmozgat¢ G‚pek Tansz‚k‚n         * * *
* * *  K‚sz¡tette:dr.R cz Korn‚lia egy.adjunktus                    * * *
* * *                           2001-2003.                          * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
}
   { A grafikus megjelenit‚shez szks‚ges  br k.}

Unit ABRA;
Interface
Uses Dos,Crt,Graph,ADAT,SEGED;
  Procedure LEPTEK;     Procedure LEPTEK0;   Procedure EXCENTER;
  Procedure VEKTORABRA; Procedure TENGELY;   Procedure SORREND;
  Procedure TORORAJZ;   Procedure ABRAJELOL; Procedure DIAGR1;
  Procedure HOSSZMERET; Procedure MAGASMERET;
  Procedure NYILAK;     Procedure NAGYNYIL;
  Procedure NYILJ; Procedure NYILF; Procedure NYILL; Procedure NYILB;
  
Implementation
   {______________________________________________________________________}
Procedure LEPTEK;                                       { µbra l‚pt‚kez‚s }
Begin
  ax:=res+2*(Hm*ta1+Lf+Ln);
  If Hn+L0*sb1>Hf+Hm Then ay:=2*exc+Hn+L0*sb1 Else ay:=2*exc+Hf+Hm;
  If (150*ey/ay)<(220*ex/ax) Then el:=(150*ey/ay) Else el:=(220*ex/ax);
  r1:=trunc(exc*el); If r1<6 Then r1:=6;                         {excenter}
  xa:=trunc(300*ex-ax*el) div 2-xn; ya:=2*yn+trunc(180*ey-ay*el) div 2;{bal fels‹}
  xp:=trunc(ax*el);                                             {max.m‚ret}
  xb:=trunc(Hm*ta1*el); yb:=trunc(Hm*el); xc:=trunc(res*el); {mozg¢ p, r‚s}
  xt:=trunc(Ln*el); yt:=trunc(Hn*el);                              {t masz}
  xm:=trunc(L0*cb1*el); ym:=trunc(L0*sb1*el);                    {nyom¢lap}
  xr:=trunc(Lf*el); yr:=trunc(Hf*el);                          {pofa fels‹}
  xx:=xr+xb+xt-xm; yy:=yt+ym-yr-yb;                             {pofa als¢}
End; {____________________________________________________________________}
Procedure LEPTEK0;              { A pofa mozg s  br zol s nak l‚pt‚kez‚se.}
Begin
  ax:=res+2*(Hm*ta1+Lf+Ln);
  If Hn+L0*sb1>Hf+Hm Then ay:=2*exc+Hn+L0*sb1 Else ay:=2*exc+Hf+Hm;
  If (300*ey/ay)<(380*ex/ax) Then el:=(300*ey/ay) Else el:=(380*ex/ax);
  xp:=trunc(ax*el); x0:=xp+(getmaxx-xp) div 2-4*xn; y0:=trunc(ay*el);
  y0:=2*yd+(getmaxy-y0) div 2-trunc(sr[0,2]*el);
  xb:=trunc(Hm*ta1*el); yb:=trunc(Hm*el);                      {mozg¢ pofa}
  r1:=trunc(exc*el); If r1<6 Then r1:=6; xc:=trunc(res*el); {excenter, r‚s}
  ee:=(300*ey/(10*exc));                        {Mozg. p lya  br k l‚pt‚ke}
End; {____________________________________________________________________}
Procedure EXCENTER;                                     { E X C E N T E R }
Begin
  SetLineStyle(0,0,1); SetFillStyle(0,Eszin); SetTextStyle(0,0,0);
  t1:=trunc(1.3*xd); t2:=trunc(1.3*xd); r0:=trunc(3*ex);
  x:=x0;  y:=ya;  Ellipse(x,y,0,360,r1,r1); SetLineStyle(1,0,1);
  Line(x-t1,y,x+t1,y); Line(x,y-t2,x,y+t2); SetLineStyle(0,0,1);
  Circle(x,y+r1,r0); 
  If f=1 Then Begin
                Ellipse(x,y,0,90,2*xd,2*yd);
                MoveTo(x,y-t1-2*r0-1); alf:=-15; NYILAK; NYILB;
              End
         Else Begin
                Ellipse(x,y,90,180,2*xd,2*yd);
                MoveTo(x,y-t1-2*r0-1); alf:=+15; NYILAK; NYILJ;
              End;
End; {____________________________________________________________________}
Procedure TENGELY;                    { T”r‹g‚p rajz - excenteres tengely.}
Begin
  SetColor(Aszin); Ellipse(si[0,1],si[0,2]-r1,0,360,r1,r1);
  Ellipse(si[0,9],si[0,10]-r1,0,360,r1,r1);
  SetLineStyle(1,0,1);                                     {exc. tengelyek}
  Line(si[0,9],si[0,10],si[0,9],si[0,10]-2*r1);
  Line(si[0,9]-r1,si[0,10]-r1,si[0,9]+r1,si[0,10]-r1);
  Line(si[0,1],si[0,2],si[0,1],si[0,2]-2*r1);
  Line(si[0,1]-r1,si[0,2]-r1,si[0,1]+r1,si[0,2]-r1);
End; {____________________________________________________________________}
Procedure MERETEK;                           { Geometriai m‚retek megad sa}
Begin
  SetViewport(0,0,getmaxx,getmaxy,clipon); alf:=0; NYILAK;
  x1:=xf0+xa+xp-xt; y1:=yf0+ya+r1+r0; Line(x1-xr-r0,y1+yr,x1-xr-r0,y1-yd);
  Line(x1+xt,y1+yd,x1+xt,y1+yt-yd); Line(x1,y1,x1+2*xd,y1);
  Line(x1-xr,y1+yr,x1-xr+xd,y1+yr); Line(x1-xb-xr,y1+yr+yb,x1+xt-xd,y1+yr+yb);
  Line(x1-xb-xr-(xc div 2),y1+yr+yb,x1-xb-xr-(xc div 2),y1+yr+yk);
  ADATCIM; SetUserCharsize(1,3,1,3); st1:='à';
  OutTextXY(x1-xb-(xr div 2)-xc-4,y1+yk-yd,st1); SetTextStyle(0,0,0);
  x:=x1+r0+xt-xm; y:=y1+yt+ym; Line(x,y,x+xm-q,y); st1:='L'; st2:=' o';
  OutTextXY(x-xd+xm div 2,y-ym-xd-q,st1); OutTextXY(x-xd+xm div 2,y-ym-xd,st2);
  st1:='á'; OutTextXY(x+2*xm div 3,y-ym div 2+q,st1);
  y:=yr; x1:=x1+xt+xd; If y<0 Then x1:=x1+2*xd; st1:='H'; st2:=' f'; MAGASMERET;
  If y<0 Then x1:=x1-2*xd; y1:=y1+yr; y:=yb; st2:=' m'; MAGASMERET;
  x1:=x1+5*xd; y1:=y1-yr; y:=yt; st2:=' n'; MAGASMERET;
  x1:=xf0+xa+xp-xt-r0; y1:=y1-2*r1-yk; x:=xt+r0; st1:='L'; st2:=' n'; HOSSZMERET;
  x1:=x1-xr; x:=xr; st2:=' f'; HOSSZMERET;
  x1:=x1-xb-xc; x:=xc; If Hm>Hn Then y1:=y1+yk+yb div 2 Else y1:=y1+yt+2*yk+q;
  st1:='e'; st2:=' '; HOSSZMERET;
End; {____________________________________________________________________}
Procedure TORORAJZ;                             { A t”r‹g‚p ar nyos  br ja}
Begin
  f:=1; x0:=xa+xc+xb+xr; x0:=x0+xm+xx; EXCENTER;
  y0:=ya+r1+r0; SetLineStyle(0,0,3);
  MoveTo(x0,y0); LineRel(-xr,yr); LineRel(-xb,yb); LineRel(xx,yy);
  Line(x0,y0,x0+xt-xm,y0+yt+ym); Line(x0+xt-xm+2*r0,y0+yt+ym,x0+xt+r0,y0+yt);
  SetLineStyle(0,0,1); Circle(x0+xt+2*r0,y0+yt,r0); Circle(x0+xt-xm+r0,y0+yt+ym,r0);
  f:=2; x0:=x0-2*(xb+xr)-xc; EXCENTER; SetLineStyle(0,0,3);
  MoveTo(x0,y0); LineRel(xr,yr); LineRel(xb,yb); LineRel(-xx,yy);
  Line(x0,y0,x0-xt+xm,y0+yt+ym); Line(x0-xt+xm-2*r0,y0+yt+ym,x0-xt-r0,y0+yt);
  SetLineStyle(0,0,1); Circle(x0-xt-2*r0,y0+yt,r0); Circle(x0-xt+xm-r0,y0+yt+ym,r0);
  MERETEK; SetViewport(0,0,getmaxx,getmaxy,clipon);
End; {____________________________________________________________________}
Procedure KISKOR;
Begin
  x1:=ai[i,2*j-1]; y1:=ai[i,2*j]; Circle(x1,y1,r0); SetColor(Aszin);
End; {____________________________________________________________________}
Procedure SORREND;                                {a mozg sp lya sorrendje}
Begin
  SetColor(Aszin); i:=72; KISKOR; st1:='0.'; OutTextXY(x1+3,y1,st1);
  SetColor(9); i:=18; KISKOR; st1:='I.'; OutTextXY(x1+xd+k*2*xd-3,y1-q,st1);
  SetColor(3); i:=36; KISKOR; st1:='II.'; OutTextXY(x1-2*q-k*2*xd,y1-2*q,st1);
  SetColor(12); i:=54; KISKOR; st1:='III.'; OutTextXY(x1-2*xd-k*3*xd,y1-q,st1);
End; {____________________________________________________________________}
Procedure ABRAJELOL;                            {µbra jel”l‚s magyar zata }
Begin
  For j:=1 to 5 do
    Begin
      SetColor(szi[j]); SetLineStyle(0,0,3);
      Line(2*xn,4*yk+(2*j-1)*yn,4*xn,4*yk+(2*j-1)*yn);
      SetLineStyle(0,0,1); Line(2*xn,4*yk+2*j*yn,4*xn,4*yk+2*j*yn);
      OutTextxy(5*xn,4*yk+(2*j-1)*yn,tex[j]);
    End;
  SetLineStyle(0,0,3); Line(2*xn,4*yk+12*yn,4*xn,4*yk+12*yn);
  OutTextxy(5*xn-xd,4*yk+12*yn-yd,'t”r');
  SetLineStyle(0,0,1); Line(2*xn,4*yk+13*yn,4*xn,4*yk+13*yn);
  OutTextxy(5*xn-xd,4*yk+13*yn-yd,'r¡t');
End; {____________________________________________________________________}
Procedure HOSSZMERET;                             { Hossz m‚ret kott z sa.}
Begin                             {y1,x1-kezd, x-hossz, st1-jel, st2-index}
  MoveTo(x1,y1-yd); LineRel(0,2*yd); MoveRel(0,-yd); SetTextJustify(0,1);
  If x>2*xd
    Then Begin NYILB; LineRel(x,0); NYILJ; x2:=x1+(x div 2); End
    Else Begin
           NYILJ; MoveRel(-xd,0); LineRel(x+3*xd,0);
           MoveRel(-2*xd,0); NYILB; x2:=x1+x+xd
         End;
  MoveRel(0,-yd); LineRel(0,2*yd); xny:=x2; yny:=y1-yd-q;
  OutTextXY(x2-5,y1-yd-q,st1);  OutTextXY(x2-5,y1-yd,st2);
End; {____________________________________________________________________}
Procedure MAGASMERET;                      { Fgg“leges m‚retek kott z sa.}
Begin                      {x1,y1-kezd. fels“, y-hossz, st1-jel, st2-index}
  MoveTo(x1,y1); LineRel(2*xd,0); MoveRel(-xd,0); SetTextJustify(0,1);
  If y>0 Then j:=-1 Else j:=1;
  If abs(y)>2*yd
    Then Begin If y>0 Then NYILF Else NYILL; LineRel(0,y);
               If y>0 Then NYILL Else NYILF; y2:=y1+(y div 2); End
    Else Begin If y>0 Then NYILL Else NYILF; MoveRel(0,j*2*yd);
                      LineRel(0,y-j*4*yd); MoveRel(0,j*2*yd);
                      If y>0 Then Begin NYILF; y2:=y1-yd; End
                             Else Begin NYILL; y2:=y1+y-yd; End; End;
  MoveRel(-xd,0); LineRel(2*xd,0); xny:=x1+2*xd; yny:=y2-2;
  SetViewport(xny,yny,xny+2*xd,yny+3*q,clipon); ClearViewport;
  SetViewport(0,0,getmaxx,getmaxy,clipon);
  OutTextXY(xny,yny,st1); OutTextXY(xny,yny+q,st2);
  SetTextStyle(0,0,0); OutTextXY(xny,yny,st1); OutTextXY(xny,yny+q,st2);
End; {____________________________________________________________________}
Procedure VEKTORABRA;                                   { Er‹k  br zol sa }
Begin
  a1:=0; a2:=0; ax:=fr[1,1]; ay:=fr[1,2]; SetColor(Aszin);
  SetUserCharSize(1,2,1,2); OutTextxy(2*xk,8*xn+xd,'Er“k vektor br ja');
  ADATCIM; OutTextxy(5*xk,8*xn+xd+3,'( a legnagyobb n‚vleges r‚sny¡l sn l )');
  SetColor(1);
  OutTextxy(3*xk,8*xn+yk+yd,'A sz mszer– ‚rt‚kekn‚l ‚s a vektor br ban');
  OutTextxy(3*xk,9*xn+yk+yd,'     az egyes er“k sz¡njelz‚se azonos.');
  SetColor(Aszin); If fr[3,1]>0 Then a1:=-fr[3,1];                {x,y max}
  If fr[2,2]>0 Then ay:=-fr[3,2] Else If fr[3,2]>0 Then a2:=-fr[3,2];
  If (200/(ay-a2))<(450/(ax-a1)) Then el:=200/(ay-a2) Else el:=450/(ax-a1);
  yy:=trunc(a2*el); xx:=trunc(a1*el); xt:=trunc(ax*el); yt:=trunc(ay*el);
  If yt<xd Then yt:=2*xd;
  y0:=16*xn+xd-(yt+yy) div 2; x0:=koz+xn-(xt-xx) div 2; SetTextStyle(0,0,1);
  SetColor(Aszin); Line(x0-xd,y0,x0+xt,y0); MoveTo(x0+xt,y0); NYILJ;
  OutTextxy(x0+xt-xn,y0+xd,' + X'); Line(x0,y0-xd,x0,y0+yt); MoveTo(x0,y0+yt); NYILL;
  OutTextxy(x0-2*xn,y0+yt,' + Y'); MoveTo(x0,y0); SetLineStyle(0,0,3);
  For j:=1 to 3 do
    Begin SetColor(szi[j]); SetLineStyle(0,0,3); a1:=fr[j,1]*el; a2:=fr[j,2]*el;
          LineRel(trunc(a1),trunc(a2)); a3:=sqrt(a1*a1+a2*a2);
          If a3>12 Then Begin alf:=trunc(-fr[j,0]/rad); NAGYNYIL;  End;
          If j=3 Then MoveRel(trunc(-fr[3,1]*el),trunc(-fr[3,2]*el));
    End;
  alf:=0; NYILAK; ADATCIM; SetColor(Aszin);
End; {____________________________________________________________________}
Procedure DIAGR1;                                   { Diagramok l‚pt‚kez‚se }
Begin
  For j:=1 to 45 do If p[i0,j]>p[i0,46] Then p[i0,46]:=p[i0,j];         {max}
  a1:=p[i0,46]; el:=250*ey/a1; y:=250; FELIRAT; ADATCIM; SetColor(Aszin);
  Line(x0,y0,x0+8*xk+xn,y0); MoveTo(x0+8*xk+xn,y0); NYILJ;
  OutTextxy(x0+8*xk-2*xn,y0+yk+q,'H  [mm]');
  OutTextxy(x0+8*xk-2*xn+2,y0+yk+2*q,' n');
  Line(x0,y0,x0,y0-y-yn); MoveTo(x0,y0-y-xn); NYILF;
  OutTextxy(x0-xn-4,y0-y-2*yn,st3); SetUserCharSize(1,2,1,3);
  OutTextxy(x0-xn+q,y0-y-2*yn+q,st2); SetLineStyle(1,0,1); SetTextStyle(0,0,1);
  For i:=0 to 8 do
    Begin
      Line(x0+i*xk,y0,x0+i*xk,y0-y); str(trunc(p[0,1+i*5]):3,ada);
      OutTextxy(x0-xn+i*xk+q,y0+yd,ada);
    End;
  For i:=1 to 5 do
    Begin
      Line(x0,y0-i*2*yk,x0+8*xk,y0-i*2*yk);
      If ((i0>7) and (i0<11)) Then str(trunc(i*a1/5):3,ada) Else
        If ((i0=7) or (i0=11)) Then str(i*a1/5:4:2,ada) Else str(i*a1/5:4:1,ada);
      OutTextxy(x0-2*xn-2,y0-i*2*yk-2,ada);
    End;
  ADATCIM; SetUserCharSize(1,2,2,5); OutTextxy(2*xn,6*yk+q,'Jel”l‚s:');
  SetTextStyle(0,0,1);
  For j:=1 to 5 do
    Begin
      SetColor(szi[j]); SetLineStyle(0,0,3); Line(xn,(7+j)*yk,3*xn,(7+j)*yk);
      OutTextxy(4*xn,(7+j)*yk-3,'á='); OutTextxy(7*xn-q,(7+j)*yk-3-q,'o');
      str(p[j-1,0]:4:1,ada); OutTextxy(5*xn,(7+j)*yk-3,ada);
    End;
  SetLineStyle(0,0,3); 
  For j:=1 to 5 do
    Begin
      yy:=trunc(p[i0,j]*el); MoveTo(x0,y0-yy); SetColor(szi[j]);
      For i:=0 to 8 do Begin a2:=p[i0,j+5*i]; LineTo(x0+i*xk,y0-trunc(a2*el)); End;
    End;
  TOVABB;
End; {______________________________________________________________________}
Procedure NYILAK;                                        { Nyilak m‚retei }
Begin
  ny[1,1]:=trunc(+xd*cos((30-alf)*rad)); ny[2,3]:=ny[1,1];
  ny[1,2]:=trunc(+yd*sin((30-alf)*rad)); ny[2,4]:=ny[1,2];
  ny[1,3]:=trunc(-xd*cos((30+alf)*rad)); ny[2,1]:=ny[1,3];
  ny[1,4]:=trunc(+yd*sin((30+alf)*rad)); ny[2,2]:=ny[1,4];
  ny[3,1]:=trunc(+xd*sin((30-alf)*rad)); ny[4,3]:=ny[3,1];
  ny[3,2]:=trunc(-yd*cos((30-alf)*rad)); ny[4,4]:=ny[3,2];
  ny[3,3]:=trunc(+xd*sin((30+alf)*rad)); ny[4,1]:=ny[3,3];
  ny[3,4]:=trunc(+yd*cos((30+alf)*rad)); ny[4,2]:=ny[3,4];
End; {____________________________________________________________________}
Procedure NYILJ;                                       { N Y I L  J O B B }
Begin
  SetLineStyle(0,0,1); xny:=getx; yny:=gety; MoveTo(xny-ny[1,1],yny-ny[1,2]);
  LineRel(ny[1,1],ny[1,2]); LineRel(ny[1,3],ny[1,4]); MoveTo(xny,yny);
End; {____________________________________________________________________}
Procedure NYILB;                                       { N Y I L  J O B B }
Begin
  SetLineStyle(0,0,1); xny:=getx; yny:=gety; MoveTo(xny-ny[2,1],yny-ny[2,2]);
  LineRel(ny[2,1],ny[2,2]); LineRel(ny[2,3],ny[2,4]); MoveTo(xny,yny);
End; {____________________________________________________________________}
Procedure NYILF;                                         { N Y I L  F E L }
Begin
  SetLineStyle(0,0,1); xny:=getx; yny:=gety; MoveTo(xny-ny[3,1],yny-ny[3,2]);
  LineRel(ny[3,1],ny[3,2]); LineRel(ny[3,3],ny[3,4]); MoveTo(xny,yny);
End; {____________________________________________________________________}
Procedure NYILL;                                           { N Y I L  L E }
Begin
  SetLineStyle(0,0,1); xny:=getx; yny:=gety; MoveTo(xny-ny[4,1],yny-ny[4,2]);
  LineRel(ny[4,1],ny[4,2]); LineRel(ny[4,3],ny[4,4]); MoveTo(xny,yny);
End; {____________________________________________________________________}
Procedure NAGYNYIL;                           { N A G Y  N Y I L  J O B B }
Begin
  SetLineStyle(0,0,3); xny:=getx; yny:=gety;
  ny[1,1]:=trunc(16*cos((30-alf)*rad)); ny[1,2]:=trunc(16*sin((30-alf)*rad));
  ny[1,3]:=-trunc(16*cos((-30-alf)*rad)); ny[1,4]:=-trunc(16*sin((-30-alf)*rad));
  MoveTo(xny-ny[1,1],yny-ny[1,2]);
  LineRel(ny[1,1],ny[1,2]); LineRel(ny[1,3],ny[1,4]); MoveTo(xny,yny);
End; {____________________________________________________________________}

Begin
End.
{**********************************  E N D  ******************************}
