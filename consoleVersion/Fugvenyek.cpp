#include "Fugvenyek.h"

void Duplex::alapszamit()
{
sa1 = sin(al*rad);
sb1 = sin(bet*rad); 
ca1 = cos(al*rad);
cb1 = cos(bet*rad);
ta1 = sa1 / ca1;
tb1 = sb1 / cb1;
}
//az alapadatokat inicializálja
//és az a tömbbe 1-tõl kezdve elkezdi feltölteni 
//módosítás: nulláról indulunk

void Duplex::alapAdatok()
//ezt kell meghívni amikor el akarom indítani a memóriából való beírást
{
nn = 400; exc = 11; res = 40; B0 = 750; al = 11.5; Hm = 1600; Hf = -110; Lf = 270;
Hn = 2080; Ln = 100; L0 = 345; bet = 15; e0 = 22; em = 70; Df = 550; ro = 2.5; w = 14.5;
	a[0] = nn; a[1] = exc; a[2] = res; a[3] = B0; a[4] = al; a[5] = Hm; a[6]= Hf;
	a[7] = Lf; a[8] = Hn; a[9] = Ln; a[10] = L0; a[11] = bet; a[12] = e0; a[13] = em;
	a[14] = 1050; a[15] = 2080; a[16] = -1; a[17] = 15; a[18] = Df; a[19] = ro; a[20] = w;
}
//a bemenõ adatok jelõlésének és dimenizióinak felsorolása
void adat0();
//later bitch 


void Duplex::toroAbra()
{
	//under constructon, graphical interface needed
}

void Duplex::eroszamit()
{

}

void Duplex::szamit()
{
	alapszamit();
	po = Hm / ca1;
	pf = sqrt(Hf*Hf + Lf*Lf); //po pofa hossz pf felso hossz
	if (Hf == 0)
		de = M_PI / 2;
	else
		de = atan(Lf / Hf);
	if (Lf == 0)
		de = 0;
	if (de < 0)
		de = M_PI + de;
	a1 = Hn + L0*sb1;
	a2 = L0*cb1 - Ln;
	pm = sqrt(a1*a1 + a2*a2);
	ka = atan(a2 / a1);
	if (a2 == 0)
		ka = 0;
	sf = de - ka;
	a1 = a1 - Hf - Hm;
	a2 = Hm*ta1 - a2 + Lf;
	pa = sqrt(a1*a1 + a2*a2);
	om = atan((Lf + Hm*ta1) / (Hm + Hf));
	pr = sqrt((Hm + Hf)*(Hm + Hf) + (Lf + Hm*ta1)*(Lf + Hm*ta1));
	if (a1 == 0)
		de = M_PI / 2;
	else
		de = atan(a2 / a1);
	if (de < 0)
	{
		de = M_PI + de;
	}
	sa = ka + de;
}

void Duplex::print() const
{
	cout << this->sa1 << endl;
	cout << this->sb1 << endl;
	cout << this->ca1 << endl;
	cout << this->cb1 << endl;
	cout << this->ta1 << endl;
	cout << this->tb1 << endl;
}

void Duplex::maxLoket()
{
	smax = sr[0][5];
	smin = sr[0][5];
	for (int i = 0; i < 72; i++)
	{
		if (smax > sr[i][5])smax = sr[i][5];
		if (smin < sr[i][5])smin = sr[i][5];

	}
}

void Duplex::techAdatok()
{
	me = 4;
	o = 0;
	hi = 0;
	for(int i=1;i<=19;i++)
		for (int j = 0; j <= 10; j++)
		{
			b[i][j] = 0;
		}
}

void Duplex::pofaMozgas()
{
	sr[0][1] = -Ln;
	sr[0][2] = -Hn;
	sr[0][0] = ta1;
	sr[0][3] = -L0*cb1;
	sr[0][4] = L0*sb1;
	sr[0][7] = sr[0][1] - Lf;
	sr[0][ 8] = sr[0][ 2] + Hf;
	sr[0][ 5] = sr[0][ 7] - Hm*ta1; 
	sr[0][ 6]= sr[0][ 8] + Hm;
	px = sr[0][ 1];
	py = sr[0][ 2];
	a1 = sqrt(sr[0][ 1] * sr[0][ 1] + sr[0][ 2] * sr[0][ 2]);
	for (int i = 0; i <= 72; i++)
	{

	}

}


