<?
ForEach($PhpConfig As $k=>$v)
{
  If(Is_String($v)) Array_Push($Args, '-d', $k.'='.$v); Else
  If(Is_Array($v)) 
    ForEach($v As $k2=>$v2)
      Array_Push($Args, '-d', $k.'.'.$k2.'='.$v2); 
}

Array_Push($Args, '-c', $PHP_Path);
Array_Push($Args, '-f', $CallFile);
Array_Push($Args, '--');
Array_Push($Args, ...Array_Slice($argv, 2));

If(!$Ver) $Ver='84';
