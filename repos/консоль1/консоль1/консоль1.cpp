// �������1.cpp: ������� ���� �������.

#include "stdafx.h"
#include "form1.h"

using namespace �������1;
[STAThreadAttribute]

int main(array<System::String^>^ args)
{
	Console::WriteLine(L"����������, ����!");
	Console::ReadLine();  //  �����

	Application::EnableVisualStyles();  // ��������� ���������� �������� Windows XP
	Application::SetCompatibleTextRenderingDefault(false);

	Application::Run(gcnew form1()); //�������� �������� ���� � ��� ������

	return 0;
}