package com.as3collections.iterators
{
	import com.as3collections.core.IIterator;
	import com.as3collections.stacks.Stack;
	import com.as3collections.stacks.IStack;
	import com.as3collections.queues.Queue;

	public class StackIterator implements IIterator
	{
		private var queue:Queue;
		
		public function get hasNext():Boolean { return !queue.isEmpty; }
		
		public function StackIterator( stack:IStack )
		{
			queue = new Queue();
			
			while ( !stack.isEmpty )
				queue.enqueue( stack.pop() );
				
			var items:Array = queue.toArray();
			while ( items.length )
				stack.push( items.pop() );
		}
		
		public function next():Object
		{
			return queue.dequeue();
		}
		
		public function peek():Object
		{
			return queue.head;
		}
	}
}