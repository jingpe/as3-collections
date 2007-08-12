package com.as3collections.core
{
	public interface IIterator
	{
		function get hasNext():Boolean;
		
		function next():Object;
		function peek():Object;
	}
}