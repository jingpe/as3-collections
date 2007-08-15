package com.as3collections.collections
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.ICollection;
	import com.as3collections.core.IVisitor;
	import com.as3collections.iterators.ArrayIterator;

	public dynamic class ArrayCollection implements ICollection
	{
		private var _array:Array;
		public function get array():Array { return _array; }
		
		public function get count():uint { return array.length; }
		public function get isEmpty():Boolean { return count == 0; }
		
		public function ArrayCollection( array:Array=null ):void
		{
			if ( array )
				_array = array;
			else
				_array = new Array();
		}
		
		public function accept(visitor:IVisitor):void
		{
			var iterator:IIterator = getIterator();
			while ( iterator.hasNext && !visitor.isDone )
				visitor.visit( iterator.next() );
		}
		
		public function clear():void
		{
			while ( length > 0 )
				array.pop();
		}
		
		public function getIterator():IIterator
		{
			return new ArrayIterator( array.splice(0) );
		}
		
		public function toString():String
		{
			return array.toString();
		}
	}
}