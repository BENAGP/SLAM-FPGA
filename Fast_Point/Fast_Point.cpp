#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
#include <math.h>
#include <iomanip>
#include "Fast_Point.h"

using namespace std;

//txt格式
struct txt_jpg
{
	int size_x;
	int size_y;
	int x;
	int y;
	int arpha;
	int out[16];
	string result;
};

//16进制转10进制
int hexCharToNum(const char c)
{
	int temp;
	temp = 0;
	switch (c)
	{
	case '0':
		temp = 0;break;
	case '1':
		temp = 1;break;
	case '2':
		temp = 2;break;
	case '3':
		temp = 3;break;
	case '4':
		temp = 4;break;
	case '5':
		temp = 5;break;
	case '6':
		temp = 6;break;
	case '7':
		temp = 7;break;
	case '8':
		temp = 8;break;
	case '9':
		temp = 9;break;
	case 'A':
	case 'a':
		temp = 10;break;
	case 'B':
	case 'b':
		temp = 11;break;
	case 'C':
	case 'c':
		temp = 12;break;
	case 'D':
	case 'd':
		temp = 13;break;
	case 'E':
	case 'e':
		temp = 14;break;
	case 'F':
	case 'f':
		temp = 15;break;
	default:
		break;
	}
	return temp;
}

//两位转化
int hexStrToInt(const string& str)
{
	int highBit = 0;
	char lowBit = 0;

	highBit = hexCharToNum(str[0]);
	lowBit = hexCharToNum(str[1]);

	return lowBit + 16 * highBit;
}

//Read txt data
struct txt_jpg * read_txt(string path)
{
	ifstream myfile(path);
	string size_x;
	string size_y;
	string arpha;
	if (!myfile.is_open())
	{
		cout << "can not open the file" << endl;
	}

	myfile >> size_x;
	myfile >> size_y;
	cout << "Size:" << hexStrToInt(size_x) << "*" << hexStrToInt(size_y) << endl;
	int size = hexStrToInt(size_x) * hexStrToInt(size_y);
	txt_jpg *data = new txt_jpg[size];

	for (int i = 1; i <= hexStrToInt(size_y); i++)
	{
		for (int j = 1; j <= hexStrToInt(size_x); j++)
		{
			myfile >> arpha;
			data[j - 1 + (i - 1) * hexStrToInt(size_x)].arpha = hexStrToInt(arpha);
			data[j - 1 + (i - 1) * hexStrToInt(size_x)].size_x = hexStrToInt(size_x);
			data[j - 1 + (i - 1) * hexStrToInt(size_x)].size_y = hexStrToInt(size_y);
			data[j - 1 + (i - 1) * hexStrToInt(size_x)].y = i;
			data[j - 1 + (i - 1) * hexStrToInt(size_x)].x = j;
		}
	}

	return data;
}

int out(int x, int y, txt_jpg *data)
{
	int out = 0;
	int point = data[x - 1 + (y - 1) * data[0].size_x].arpha;
	int xx[16] = { 0, 1, 2, 3, 3, 3, 2, 1, 0, -1, -2, -3, -3, -3, -2, -1};
	int yy[16] = { -3, -3, -2, -1, 0, 1, 2, 3, 3, 3, 2, 1, 0, -1, -2, -3};
	for (int i = 0; i < 16; i++)
	{
		if (data[x - 1 + xx[i] + (y - 1 + yy[i]) * data[0].size_x].arpha < point*0.75 || data[x - 1 + xx[i] + (y - 1 + yy[i]) * data[0].size_x].arpha > point*1.25)
			out = out + pow(2, i);
	}
	
	return out;
}

//int main()
//{
//	txt_jpg *data;
//	data = read_txt("c:/users/cymfg/desktop/data.txt");
//	//cout << data[603].arpha << "x:" << data[603].x << "y:" << data[603].y << endl;
//	//cout << data[800].arpha << "x:" << data[800].x << "y:" << data[800].y << endl;
//	//cout << out(4, 4, data) << endl;
//	//this is a test.
//
//	ofstream infile;
//	infile.open("c:/users/cymfg/desktop/data_out.txt", ios::out);
//	if (infile.is_open())
//	{
//		for (int i = 0; i < (data[0].size_y - 6); i++)
//		{
//			for (int j = 0; j < (data[0].size_x - 6); j++)
//			{
//				infile << setfill('0') << setw(4) << hex << out((j+4),(i+4), data);
//				infile << " ";
//				//cout << setfill('0') << setw(4) << hex << out((j + 4), (i + 4), data) << endl;
//				cout << i * data[0].size_x + j << endl;
//			}
//		}
//		infile << eof;
//	}
//	infile.close();
//	return 0;
//}