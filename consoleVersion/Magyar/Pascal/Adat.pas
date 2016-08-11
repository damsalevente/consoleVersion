

{
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * *                                                               * * *
* * *                   Pof†s kãtîrãgÇp mozg†sa                     * * *
* * *                         ADAT unit                             * * *
* * *                                                               * * *
* * *  KÇszÅlt: a BME êp°tì-Çs Anyagmozgat¢ GÇpek TanszÇkÇn         * * *
* * *  KÇsz°tette:dr.R†cz KornÇlia egy.adjunktus                    * * *
* * *                           1997.                               * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
}
 { E programrÇsz az adat deklaraci¢t tartalmazza. }

Unit ADAT;
Interface
Uses Dos,Crt,Graph;
Procedure Adatdekl;
Const
  ures    :FillPatternType=($0,$0,$0,$0,$0,$0,$0,$0);               {tîrlÇs}
  fi      :FillPatternType=($6c,$da,$da,$fe,$7c,$30,$60,$60);           {fi}
  rob     :FillPatternType=($3c,$66,$66,$3c,$18,$0c,$0c,$38);           {ro}
  g=9806.65;                                {nehÇzsÇgi gyorsul†s, mm/s2-ben}
  epsz=1e-25;                                       {szîgfÅggvÇny pontoss†g}
  rad=pi/180;                                              {FOK-b¢l, radi†n}
  ez=1000;                                                        { m - mm }
  Verzioszam='1';                                             {File kezelÇs}

Type
  DsplLin = string[80];                         { globalis sztringformatum }
  t_ident = (Version,Inpconst1,Inpconst2);
  t_actdata = record
     case Ident : t_Ident of
           version : (Actversion : DsplLin);
         Inpconst1 : (a:array[1..22]of real);
         Inpconst2 : (inev:integer; cimek:array[1..40]of string[13]);
     end;                                                      { of record }
  t_Irasolvasas = (iras,olvasas);

Var
  betu                               :FillPatternType;         {gîrîg betñk}
  grdriver,grmode,errcode,alf,me     :integer;            {alap be†ll°t†sok}
  i,n,k,j,f,i1,j1,i0,r               :integer;              {cikl. v†ltoz¢k}
  xasp,yasp,Aszin,Eszin,Hatter,Color :word;
  j0                                 :string[1];
  ex,ey,el,ee,ev                     :real;        {kÇpernyì, †br†k lÇptÇke}
  sp,c0,ja,be,le,c1                  :char;              {program v†laszt†s}
  be_char,ja_char,le_char,c1_char    :set of char;       {program v†laszt†s}
  ada,st1,st2                        :string[7];              {adat-sztring}
  st3                                :string[10];             {adat-sztring}
  adatok,hiba,hi,di,o                :integer;                {van j¢ adat?}
  x0,y0,xk,yk,xn,yn,q,koz,xd,yd      :integer;         {†bra,szîveg kezdìp.}
  xf,yf,xa,ya,xbe,ybe,xa0,ya0,xf0,yf0:integer;     {keret, †bra hely adatok}
  m,xj,yj,x,y,x1,y1,x2,y2            :integer;    {val utas°t†s,hiba kiir†s}
  ra,t1,t2,xm,ym,xx,yy,xny,yny       :integer;            {tipusok, mÇretek}
  xt,yt,xp,xc,xg,yg,xr,yr,xb,yb      :integer;     {excenter,tîrãgÇp koord.}
  r1,r0                              :word;               {excenter mÇretek}
  nn,exc,res,B0,al,Hm,Hf,Lf,Hn       :real;                  {bemenì adatok}
  Ln,L0,bet,e0,em,w,Df,ro            :real;                  {bemenì adatok}
  a                           :array[1..21] of real;         {bemenì adatok}
  b                           :array[1..19,0..10] of real;  {rÇsv†lt adatok}
  jel           :array[1..14] of string[55];       {adatok szîveges megnev.}
  jel1          :array[1..14,1..2] of string[20];          {adatok jelîlÇse}
  p             :array[0..13,0..46] of real;       {H nyom¢lap v†ltoztat†sa}
  sr            :array[0..72,0..8] of real;  {pofa szîg+tîrîgÇp koordin†t†k}
  si            :array[0..72,1..16] of integer;        {tîrîgÇp koordin†t†k}
  ar            :array[0..72,0..10] of real;            {mozg.p†lya,prizm†k}
  fr            :array[1..3,0..2] of real;                 {erã komponensek}
  ai            :array[0..72,1..16] of integer;        {tîrÇs-År°tÇs koord.}
  szi           :array[1..5] of word;                      {diagram jelîlÇs}
  tex           :array[1..5] of string[4];                 {diagram felirat}
  ny            :array[1..4,1..4] of integer;                       {nyilak}
  hat           :array[1..5,1..2] of integer;                {tart. hat†rok}
  ert           :array[1..5,1..2] of real;                   {tart. ÇrtÇkek}
  QP            :array[1..11,0..5] of real;                     {eredmÇnyek}
  po1           :array[1..4,1..2] of integer;                   {mozg¢ pofa}
  res0,smax,smin,vy,garat,any,loket,om,dom :real;           {rÇszeredmÇnyek}
  a1,a2,a3,a4,a5,ax,ay,px,py,h2,u  :real;          {rÇszeredmÇnyek,†bra}
  po,pf,pm,pa,pr,de,ka,sf,sa,ep  :real;            {sz†m°tott mÇretek}
  dt,tu,sz,db,laz,vn,h1,vk,eta,Qmax,Pmax,vmax :real;     {sz†m°tott mÇretek}
  sa1,ca1,sb1,cb1,ta1,tb1,u0,u1,u2,u3  :real;             {szîgf: alfa,beta}
  v1,dv,kv,vme,v0,Qn,Pn,Ft   :real;     {rÇszeredmÇnyek}

  cimek                     :array[1..40] of string[13];        {File cimek}
  reset_hiba                : byte;
  FileNev,Nev_regi,DefExt,FN,EredNev:DsplLin;                 {File kezelÇs}
  FileMeret                 :longint;
  AdatFile,CimFile          :file of t_ActData;
  ActData                   :t_ActData;
  DkeyB,Err                 :Boolean;
  lin,fhiba,inev,xa1,xa2,ya1,ya2,uj,ujj    :integer;
  tdat,fa                           :char;               {program v†laszt†s}

  sorok                           :string[84];                  {eredmÇnyek}
  cs                              :string[4];                          { * }
  EredFile                        :file;


{ ---------------------------- V A L T O Z O K ----------------------------}
Implementation
Procedure ADATDEKL;
Begin
End;
Begin
End.

{ ********************************* E N D ******************************** }
