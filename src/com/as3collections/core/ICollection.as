package com.as3collections.core
{
	public interface ICollection
	{
		function get count():uint;
		function get isEmpty():Boolean;
		
		function accept( visitor:IVisitor ):void;
		function clear():void;
		
		function getIterator():IIterator;
	}
}