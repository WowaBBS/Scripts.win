<?
ForEach($PhpConfig As $k=>$v)
{
  If(Is_String($v)) Array_Push($Args, '-d', $k.'='.$v); Else
  If(Is_Array($v)) 
    ForEach($v As $k2=>$v2)
      Array_Push($Args, '-d', $k.'.'.$k2.'='.$v2); 
}