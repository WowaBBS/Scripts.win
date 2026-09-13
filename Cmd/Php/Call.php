#!php8
<?php //CallPHP: Help
  Set_Time_Limit(0);
  
  //Fix include path for include security
  If($Include_Path=Get_Include_Path())
    Set_Include_Path(Str_Replace(['.;', ';.','.:', ':.', '.'], '', $Include_Path));  
  
  $CallFile=$argv[1]?? '';
  If($CallFile==='') 
    Return Print("PHP File is not defined: CallPhp FineName Arg1 Arg2...ArgN\n".
      "First line of PHP file: <? \\PHP[|8|85]: Jit Mem:1512M Args: arg1 arg2...\n");
  
  Include 'Lib/All.php';

  [$Ver, $OptLine]=ParseFileInfo($CallFile);
  
  Include 'Lib/PHP/Select.php';
  
  $Options=ParseOpts($OptLine);
  $Options=DefaulOpts($Options);
  ProcessOpts($Options);

  PHP_MakeArgs();

  If(!($Options['HideInfo']??False))
    Echo "PHP$Ver ", ShowOpts($Options), "\n";

  CallExec([$PHP_Path.'\php.exe', '-q', ...$Args]);
  