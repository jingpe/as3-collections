package com.as3collections.queues
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.IVisitor;
	import com.as3collections.iterators.ArrayIterator;
	import com.as3collections.iterators.StackIterator;
	import com.as3collections.collections.ArrayCollection;

	public class ArrayQueue extends ArrayCollection implements IQueue
	{
		public function get head():Object { return array[0]; }
		
		public function ArrayQueue( array:Array=null )
		{
			super( array );
		}
		
		public function enqueue(object:Object):void
		{
			array.push( object );
		}
		
		public function dequeue():Object
		{
			return array.shift();
		}
	}
}