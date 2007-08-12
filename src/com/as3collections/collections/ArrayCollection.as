package com.as3collections.collections
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.ICollection;
	import com.as3collections.core.IVisitor;
	import com.as3collections.iterators.ArrayIterator;

	/**
	 * An ArrayCollection is essentially just an Actionscript Array that follows the
	 * semantics of ICollection.
	 * 
	 * @author Michael Avila
	 */
	public dynamic class ArrayCollection extends Array implements ICollection
	{
		public function get count():uint
		{
			return length;
		}
		
		public function get isEmpty():Boolean
		{
			return count == 0;
		}
		
		/**
		 * Creates a new ArrayCollection.
		 * 
		 * @param Array the source collection of items this collection is initiated with.
		 */
		public function ArrayCollection( source:Array=null ):void
		{
			while ( source.length )
				unshift( source.pop() );
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
				pop();
		}
		
		public function getIterator():IIterator
		{
			return new ArrayIterator( splice(0) );
		}
		
	}
}