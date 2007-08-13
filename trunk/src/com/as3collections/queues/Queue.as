package com.as3collections.queues
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.IVisitor;
	import com.as3collections.iterators.ArrayIterator;

	public class Queue implements IQueue
	{
		private var queue:Array;
		
		public function get head():Object {  return queue[0];  }
		public function get count():uint {	return queue.length;  }
		public function get isEmpty():Boolean {	return count == 0; }
		
		
		public function Queue()
		{
			queue = new Array();
		}		
		
		public function enqueue(object:Object):void
		{
			queue.push( object );
		}
		
		public function dequeue():Object
		{
			return queue.shift();
		}
		
		public function accept(visitor:IVisitor):void
		{
			var iterator:IIterator = getIterator();
			
			while ( iterator.hasNext && !visitor.isDone )
				visitor.visit( iterator.next() );
		}
		
		public function clear():void
		{
			while ( queue.length > 0 )
				queue.pop();
		}
		
		public function getIterator():IIterator
		{
			return new ArrayIterator( queue );
		}
		
		public function toString():String
		{
			return queue.join( "," );
		}
		
	}
}