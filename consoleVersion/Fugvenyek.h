#pragma once
#define _USE_MATH_DEFINES

#include <iostream>
#include <string>
#include <math.h>
#include <vector>
#include <map>
using namespace std;
class Duplex
{
private:
	const double g = 9806.65;
	const double epsz = 1e-25;
	const double rad = M_PI / 180;
	const double ez = 1000;
	//user input 
	double nn;
	double exc, res, B0, al, Nm, Hm, Hf, Lf, Hn, Ln, L0, bet, e0, em, Df, ro, w;
	int grDriver, grMode, errCode, alf, me;				//alapbeallitasok
	char xasp, yasp, Aszin, Eszin, Hatter, Color;
	string j0;
	int xf, yf, xa, ya, xbe, ybe, xa0, ya0, xf0, yf0;	//keret brahely adatok
	int ra, t1, t2, xm, ym, xx, yy, xny, yny;			//tipusok méretek
	//22 elemû tömb
	int p[13][46]; //torogep koordinatak
	double QP[11][6];	//eredmenyek
	double sr[73][8];	//valami
	double a[21];
	double b[19][11]; //bemenõ adatok, indexelés még ki kell találni mert itt minden olyan furcsa
	double si[73][16]; //törõgép koordináták
	double fr[3][3];
	int ai[72][17];//tõrés koordináták
	int hat[5][2]; //határok
	int ert[5][2]; //tart értékek
	int po1[4][2]; //mozgó pofa
	double ar[73][11];
	//excenter
	int xt, yt, xp, xc, xg, yg, xr, yr, xb, yb;
	//excenter méretek? 
	//bemenõ adatok ismét
	//bemenõ adatok ismét 
	
	char r1, r0;
	//eredmenyek
	
	double o;
	double hi;
	//részeredmények
	double a1, a2, a3, a4, a5, ax, ay, px, py, h2, u;
	//részeredemények
	double res0, smax, smin, vy, garat, any, loket, om, dom;
	//számított méretek
	double po, pf, pm, pa, pr, de, ka, sf, sa, ep;
	//számított méretek 2 
	double dt, tu, sz, db, laz, vn, h1, vk, eta, Qmax, Pmax, vmax;
	//szögfüggvény 
	double sa1, ca1, sb1, cb1, ta1, tb1, u0, u1, u2, u3;
	//részeredmények
	double v1, dv, kv, vme, v0, Qn, Pn, Ft;
public:
	//kezdeti értékek felvétele
	void alapszamit();
	//alapadatok beírása
	void alapAdatok();
	void toroAbra();
	void eroszamit();
	void szamit();
	void print()const;
	void maxLoket();
	//Technologiai adatok 
	void techAdatok();
	// jó sok pontot kiszámol jó sokáig, és utána feltölti az sr tömböt 
	void pofaMozgas();
	//pontok a pofamozgáshoz
	// ar tömböt rakja össze
	void pontok(int i);


};