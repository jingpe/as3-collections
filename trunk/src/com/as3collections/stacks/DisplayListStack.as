package com.as3collections.stacks
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.IVisitor;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import com.as3collections.iterators.StackIterator;
	import com.as3collections.collections.DisplayListCollection;
	import flash.display.DisplayObject;

	public class DisplayListStack extends DisplayListCollection implements IStack
	{
		public function get top():Object { return container.getChildAt( container.numChildren - 1 ); } 
		
		public function DisplayListStack( container:DisplayObjectContainer=null )
		{
			super( container );
		}
		
		public function push(object:Object):void
		{
			container.addChild( object as DisplayObject );
		}
		
		public function pop():Object
		{
			return container.removeChildAt( container.numChildren - 1 );
		}
		
		public override function getIterator():IIterator
		{
			return new StackIterator( this );
		}
	}
}