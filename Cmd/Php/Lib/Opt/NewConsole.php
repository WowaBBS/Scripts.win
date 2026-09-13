<?
NameSpace Call\Opt;

Return New Class('NewConsole','NewConsole[|+]','Open window in new  console') Extends TBase
{
  Function Process($Value)
  {
    Global $ExecOpt;
    $ExecOpt['create_new_console']=$Value;
  }
};
