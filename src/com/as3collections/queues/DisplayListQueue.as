package com.as3collections.queues
{
	import com.as3collections.collections.DisplayListCollection;
	import com.as3collections.core.IIterator;
	import com.as3collections.core.IVisitor;
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;

	public class DisplayListQueue extends DisplayListCollection implements IQueue
	{
		public function get head():Object { return container.getChildAt( 0 ); }
		
		public function DisplayListQueue( container:DisplayObjectContainer=null )
		{
			if ( !container )
				container = new Sprite();
				
			super( container );
		}

		public function enqueue(object:Object):void
		{
			if ( !(enqueue is DisplayObject ) )
				throw new ArgumentError( "Require an object of type DisplayObject." );
				
			container.addChild( object as DisplayObject );
		}
		
		public function dequeue():Object
		{
			return container.removeChildAt( 0 );
		}
	}
}