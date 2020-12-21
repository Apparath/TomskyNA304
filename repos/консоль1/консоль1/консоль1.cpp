// консоль1.cpp: главный файл проекта.

#include "stdafx.h"
#include "form1.h"

using namespace консоль1;
[STAThreadAttribute]

int main(array<System::String^>^ args)
{
	Console::WriteLine(L"Здравствуй, Вася!");
	Console::ReadLine();  //  пауза

	Application::EnableVisualStyles();  // Включение визуальных эффектов Windows XP
	Application::SetCompatibleTextRenderingDefault(false);

	Application::Run(gcnew form1()); //Создание главного окна и его запуск

	return 0;
}