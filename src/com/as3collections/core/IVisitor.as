package com.as3collections.core
{
	public interface IVisitor
	{
		function get isDone():Boolean;
		
		function visit( object:Object ):void;
	}
}