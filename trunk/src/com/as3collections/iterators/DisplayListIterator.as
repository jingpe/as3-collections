package com.as3collections.iterators
{
	import com.as3collections.core.IIterator;
	import flash.display.DisplayObjectContainer;
	import com.as3collections.queues.Queue;

	public class DisplayListIterator implements IIterator
	{
		private var queue:Queue;
		
		public function DisplayListIterator( owner:DisplayObjectContainer )
		{
			queue = new Queue();
			
			var index:int = 0;
			while ( index < owner.numChildren )
				queue.enqueue( owner.getChildAt( index++ ) );
		}
		
		public function get hasNext():Boolean
		{
			return !queue.isEmpty;
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