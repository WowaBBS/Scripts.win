<?php //PHP: Help
  Set_Time_Limit(0);
  
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
//Echo 'Start: ', Implode(' ', $argv),"\n";
  $PHP_File=$argv[1]?? '';
  If($PHP_File==='') 
    Return Print("PHP File is not defined: CallPhp FineName Arg1 Arg2...ArgN\n".
      "First line of PHP file: <? \\PHP[|8|85]: Jit Mem:1512M Args: arg1 arg2...\n");

  $f=FOpen($PHP_File, 'r');
  If(!$f) Return Prinr("PHP File $PHP_File not found\n");
  
  $Line = FGetS($f);
  FClose($f);
  
//$f=New SplFileObject($FlieName, 'r');
//$Line=$f->FGetS();
//$f->Close();
  
  $Ext=PathInfo($PHP_File, PATHINFO_EXTENSION);
  $Ver='';
  If(Str_Starts_With($Ext, $Prefix='php'))
    $Ver=SubStr($Ext, Strlen($Prefix));

  $ShortTags=Null;
  $Mem='1512M';
  $Jit='-';
  $Args=[];
  
  $New_Console=Null;
  
  While(1)
  {
    $Line=Explode('<?', $Line, 2);
    If(!IsSet($Line[1])) Break;
    $Line=$Line[1];
    $Line=Explode('//PHP', $Line, 2);
    If(!IsSet($Line[1])) Break;
    $Line=$Line[1];
    If(!IsSet($Line[1])) Break;
    $Line=Explode(':', $Line, 2);
    $Ver=$Line[0];
    If(!IsSet($Line[1])) Break;
    $Line=Trim($Line[1]);
    $Line=Explode(' ', $Line);
    While($Line)
    {
      $Item=Explode(':', Array_Shift($Line), 2);
      $Name  =$Item[0];
      $Value =$Item[1]?? Null;
      If(StrLen($Name) && $Name[0]==='#') Continue; // Comment
      Switch($Name)
      {
      Case '': Continue 2;
      Case 'Jit'         : $Jit=$Value?? '+'; Continue 2;
      Case 'Jit+'        : $Jit=         '+'; Continue 2;
      Case 'Jit-'        : $Jit=         '-'; Continue 2;
      Case 'NewConsole'  : $New_Console = True ; Continue 2;
      Case 'NewConsole+' : $New_Console = True ; Continue 2;
      Case 'NewConsole-' : $New_Console = False; Continue 2;
      Case 'ShortTags'   : $ShortTags   = True ; Continue 2;
      Case 'ShortTags+'  : $ShortTags   = True ; Continue 2;
      Case 'ShortTags-'  : $ShortTags   = False; Continue 2;
      Case 'ShortTags?'  : $ShortTags   = Null ; Continue 2;
      Case 'Mem'         : $Mem=$Value; Continue 2;
      Case 'Args'        : $Args=$Line; Break 2;
      Case 'Ignore'      : Break 2;
      Case 'Help':
        Echo <<<HereDoc
          Options:
            Jit, Jit+, Jit- -- Enable/Disable Jit
            Mem:[Size]      -- Size of limit memory
            NewConsole      -- Open window in new  console
            ShortTags, ShortTags+, ShortTags-, ShortTags? -- On, On, Off, Default
            Args: arg1, arg2, ... argN  -- Arguments for PHP
            Help    -- Show this message without runing script
            #Any    -- Commented option
            Ignore  -- Ignore all next options
          Example: <? //PHP8: Jit Mem:2G NewConsole- #Help Ignore Args: -d short_open_tag=Off
          Exec: CallPhp FineName Arg1 Arg2...ArgN
          HereDoc;
        Return;
      Default:
        Echo 'Unknown arg ', $Name, ':', $Value;
        Break;
      }
    }
    Break;
  }
  
  $PHP_Path='C:\SRV\Script\PHP\V8x4'; //TODO: Detect
  If($Mem) Array_Push($Args, '-d', 'memory_limit='.$Mem);
  Switch($Jit)
  {
  Case '-': Break;
  Case '+':
    Array_Push($Args, '-d', 'opcache.enable_cli=1');
    Array_Push($Args, '-d', 'opcache.jit_buffer_size=100M');
    Array_Push($Args, '-d', 'opcache.jit=1255');
  //Array_Push($Args, '-d', 'opcache.jit=5141');
    Break;
  }
  Array_Push($Args, '-d', 'extension_dir='.$PHP_Path.'\ext');
  If($ShortTags!==Null) Array_Push($Args, '-d', 'short_open_tag='.($ShortTags? 'On':'Off'));
  Array_Push($Args, '-c', $PHP_Path);
  Array_Push($Args, '-f', $PHP_File);
  Array_Push($Args, '--');
  Array_Push($Args, ...Array_Slice($argv, 2));

// %Arg% -f "%1" -- %2 %3 %4 %5 %6 %7 %8 %9
  
  Echo "PHP $Ver, Mem: $Mem, Jit$Jit\n";
  
  {
    $Cmd = [$PHP_Path.'\php.exe', '-q', ...$Args];
    $Cmd = ['cmd', '/C', ...$Cmd];
    
  //Echo 'Cmd: ',Implode(' ', $Cmd),"\n";
    $Descr=[STDIN, STDOUT, STDERR
    //1 => ['pipe', 'w'], // stdout
    //2 => ['pipe', 'w'], // stderr
    ];
    
    $Cwd=Null; //GetCwd(); //Echo 'Cwd: ', GetCwd(), "\n";
    $Env=Null;
    $Opt=[
    # 'suppress_errors'      => true  , // Hide system error in PHP, use @ instead
      'bypass_shell'         => true  , // Call without cmd.exe (safer)
    # 'blocking_pipes'       => false , // Forces blocking mode for created channels (pipes).
      'create_process_group' => true  , // Handle CTRL+C events independently of the parent process.
      'create_new_console'   => $New_Console?? false, // open a new graphical console window
    ];
    
    $p=Proc_Open($Cmd, $Descr, $Pipes, $Cwd, $Env, $Opt);
    
    If(!Is_Resource($p)) Return Print('Can`t start '.Implode(' ', $Cmd));
    
    Proc_Close($p);
  //Echo "Finish\n"; //TODO: Result code
  }