<?
If(Function_Exists('sapi_windows_set_ctrl_handler'))
  SApi_Windows_Set_Ctrl_Handler(MyCtrlHandler(...)); // Регистрируем наш обработчик

Function MyCtrlHandler(Int $Event)
{
  Switch($Event)
  {
  Case PHP_WINDOWS_EVENT_CTRL_C     : Echo "\nCTRL+C\n"     ; exit(0); // Выполняем безопасный выход из приложения
  Case PHP_WINDOWS_EVENT_CTRL_BREAK : Echo "\nCTRL+BREAK\n" ; exit(0);
  }
}  
