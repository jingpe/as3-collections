package com.as3collections.stacks
{
	import com.as3collections.core.ICollection;

	public interface IStack extends ICollection
	{
		function get top():Object;
		
		function push( object:Object ):void;
		function pop():Object;
	}
}