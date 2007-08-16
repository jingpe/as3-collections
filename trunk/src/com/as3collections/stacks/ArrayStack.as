package com.as3collections.stacks
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.IVisitor;
	import com.as3collections.iterators.ArrayIterator;
	import com.as3collections.iterators.StackIterator;
	import com.as3collections.collections.ArrayCollection;

	public class ArrayStack extends ArrayCollection implements IStack
	{
		public function get top():Object { return array[ array.length-1 ]; }
		
		public function ArrayStack( array:Array=null )
		{
			if ( !array )
				array = new Array();
			
			super( array );
		}
		
		public function push(object:Object):void
		{
			array.push( object );
		}
		
		public function pop():Object
		{
			return array.pop();
		}
		
		public override function getIterator():IIterator
		{
			return new StackIterator( this );
		}
	}
}