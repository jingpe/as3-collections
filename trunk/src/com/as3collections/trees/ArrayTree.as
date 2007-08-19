package com.as3collections.trees
{
	import com.as3collections.collections.ArrayCollection;
	import com.as3collections.queues.ArrayQueue;
	import com.as3collections.queues.IQueue;

	public class ArrayTree extends ArrayCollection implements ITree
	{
		private var _key:Object;
		public function get key():Object { return _key; }
		
		public function get isLeaf():Boolean { return !(key is ITree); }
		public function get children():uint { return array.length; }
		
		public function ArrayTree( key:Object, array:Array=null )
		{
			_key = key;
			
			if ( !array )
				array = new Array();
				
			super( array );
		}
		
		public function getChildTree( index:int ):ITree
		{
			return array[ index ];
		}
		
		public function addChildTree( tree:ArrayTree ):void
		{
			array.push( tree );
		}
		
		public function removeChildTree( tree:ArrayTree ):ArrayTree
		{
			return array.splice( array.indexOf( tree ), 1 )[0];
		}
		
		public function breadthFirstTraversal( visitor:IVisitor ):void
		{
			var queue:IQueue = new ArrayQueue();
			
			if ( !isEmpty )
				queue.enqueue( this );
				
			while ( !queue.isEmpty && !visitor.isDone )
			{
				var head:ITree = ITree( queue.dequeue() );
				
				visitor.visit( head.key );
				for ( var i:int=0; i<head.children; i++ )
				{
					var tree:ITree = head.getChildTree( i );
					queue.enqueue( tree );
				}
			}
		}
		
		public function depthFirstTraversal( visitor:IPrePostVisitor ):void
		{
			if ( visitor.isDone )
				return;
			
			visitor.visit( key );
			for ( var i:int=0; i<children; i++ )
				getChildTree( i ).depthFirstTraversal( visitor );
		}

		public override function toString():String
		{
			var className:String = getQualifiedClassName( this );
			return "[" + className.slice( className.lastIndexOf( ":" ) + 1, className.length ) + " " + key + " - " + array.toString() + " ]";
		}
	}
}