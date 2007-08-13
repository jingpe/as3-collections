package com.as3collections.stacks
{
	import com.as3collections.core.IIterator;
	import com.as3collections.core.IVisitor;
	import com.as3collections.iterators.ArrayIterator;
	import com.as3collections.iterators.StackIterator;

	/**
	 * A last in first out (lifo) data structure. A basic implementation of IStack using an Actionscript Array.
	 * 
	 * @author Michael Avila
	 */
	public class Stack implements IStack
	{
		protected var stack:Array;
		
		public function get top():Object {  return stack[0];  }
		public function get count():uint {	return stack.length;  }
		public function get isEmpty():Boolean {	return count == 0; }
		
		
		public function Stack()
		{
			stack = new Array();
		}
		
		
		public function push(object:Object):void
		{
			stack.push( object );
		}
		
		public function pop():Object
		{
			return stack.pop();
		}
		
		public function accept(visitor:IVisitor):void
		{
			var iterator:IIterator = getIterator();
			
			while ( iterator.hasNext && !visitor.isDone )
				visitor.visit( iterator.next() );
		}
		
		public function clear():void
		{
			while ( stack.length > 0 )
				stack.pop();
		}
		
		public function getIterator():IIterator
		{
			return new StackIterator( this );
		}
		
		public function toString():String
		{
			return stack.toString();
		}
		
		public function toArray():Array
		{
			return stack.slice(0);
		}
	}
}