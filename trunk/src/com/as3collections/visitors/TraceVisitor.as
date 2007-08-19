package com.as3collections.visitors
{
	import com.as3collections.core.IVisitor;
	import com.as3collections.trees.IPrePostVisitor;

	public class TraceVisitor implements IPrePostVisitor
	{
		public function get isDone():Boolean
		{
			return false;
		}
		
		public function preVisit( object:Object ):void {}
		
		public function visit( object:Object ):void
		{
			trace( object );
		}
		
		public function postVisit( object:Object ):void {}
	}
}