package com.as3collections.collections
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.ICollection;
	import com.as3collections.core.IVisitor;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import com.as3collections.iterators.DisplayListIterator;

	public class DisplayListCollection implements ICollection
	{
		private var _container:DisplayObjectContainer;
		public function get container():DisplayObjectContainer { return _container; }
		
		public function get count():uint { return container.numChildren; }
		public function get isEmpty():Boolean { return count == 0; }
		
		public function DisplayListCollection( container:DisplayObjectContainer=null )
		{
			if ( container )
				_container = container;
			else
				_container = new Sprite();
		}
		
		public function accept(visitor:IVisitor):void
		{
			var iterator:IIterator = getIterator();
			while ( iterator.hasNext && !visitor.isDone )
				visitor.visit( iterator.next() );
		}
		
		public function clear():void
		{
			while ( container.numChildren )
				container.removeChildAt( 0 );
		}
		
		public function getIterator():IIterator
		{
			return new DisplayListIterator( container );;
		}
	}
}