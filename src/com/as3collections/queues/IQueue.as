package com.as3collections.queues
{
	import com.as3collections.core.ICollection;

	public interface IQueue extends ICollection
	{
		function get head():Object;
		
		function enqueue( object:Object ):void;
		function dequeue():Object;
	}
}