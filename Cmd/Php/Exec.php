<?

$ExecOpt=[
# 'suppress_errors'      => true  , // Hide system error in PHP, use @ instead
  'bypass_shell'         => true  , // Call without cmd.exe (safer)
# 'blocking_pipes'       => false , // Forces blocking mode for created channels (pipes).
  'create_process_group' => true  , // Handle CTRL+C events independently of the parent process.
  'create_new_console'   => $New_Console?? false, // open a new graphical console window
];

$Args=[];

Function CallExec($Cmd)
{
  Global $ExecOpt;
  
//$Cmd = [$PHP_Path.'\php.exe', '-q', ...$Args];
//$Cmd = ['cmd', '/C', ...$Cmd];
  
//Echo 'Cmd: ',Implode(' ', $Cmd),"\n";
  $Descr=[STDIN, STDOUT, STDERR];
  
  $Cwd=Null; //GetCwd(); //Echo 'Cwd: ', GetCwd(), "\n";
  $Env=Null;
  
  $p=Proc_Open($Cmd, $Descr, $Pipes, $Cwd, $Env, $ExecOpt);
  
  If(!Is_Resource($p)) Return Print('Can`t start '.Implode(' ', $Cmd));
  
  Proc_Close($p);
//Echo "Finish\n"; //TODO: Result code
}
