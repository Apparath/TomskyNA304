unit Menu;
interface
procedure MainMenu(MenuType:string);
implementation
uses Crt;
procedure MainMenu(MenuType:string);
var ch:char;
begin
  case MenuType of 'Menu':
    begin
      writeln('--------------------------------------------');
      writeln('| База данных музыкального коллектива 0-36 |');
      writeln('--------------------------------------------');
      writeln('| 1. Добавление музыканта                  |');
      writeln('| 2. Вывод таблицы                         |');
      writeln('| 3. Увольнение музыканта                  |');
      writeln('| 4. Изменение информации о музыканте      |');
      writeln('| 5. Поиск музыкантов                      |');
      writeln('| 6. Сортировка записей                    |');
      writeln('--------------------------------------------');
      writeln('| 7. Загрузка базы данных                  |');
      writeln('| 8. Сохранение базы данных                |');
      writeln('--------------------------------------------');
      writeln('| Esc. Выход из программы                  |');
      writeln('--------------------------------------------');
      ch:=ReadKey();
      case ch of:
        '1':Input();
        '2':Output();
        '3':
      end;

    end;
  end;
end.

