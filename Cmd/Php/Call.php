<?php //CallPHP: Help
  Set_Time_Limit(0);
  
  //Echo 'Start: ', Implode(' ', $argv),"\n";
  $CallFile=$argv[1]?? '';
  If($CallFile==='') 
    Return Print("PHP File is not defined: CallPhp FineName Arg1 Arg2...ArgN\n".
      "First line of PHP file: <? \\PHP[|8|85]: Jit Mem:1512M Args: arg1 arg2...\n");
      
  Include 'Handler.php';
  Include 'Opts.php';
//Include 'PHP/Init.php';
  Include 'FileInfo.php';
  Include 'Exec.php';
  Include 'PHP/Select.php';
  
  [$Ver, $OptLine]=ParseFileInfo($CallFile);
  $Options=ParseOpts($OptLine);
  ProcessOpts($Options);

  Include 'PHP/Args.php';
  
  Array_Push($Args, '-c', $PHP_Path);
  Array_Push($Args, '-f', $CallFile);
  Array_Push($Args, '--');
  Array_Push($Args, ...Array_Slice($argv, 2));

  Echo "PHP $Ver, Mem: $Options[Mem], Jit$Options[Jit]\n";

  CallExec([$PHP_Path.'\php.exe', '-q', ...$Args]);
  