<?
NameSpace Call\Opt;

Return New Class('Mem', 'Mem:[Size]', 'Size of limit memory') Extends TBase
{
  Function Process($Value)
  {
    If($Value===Null) Return;
    Global $PhpConfig;
    $PhpConfig['memory_limit']=$Value;
  }

  Function GetDefault() { Return '512M'; }
};