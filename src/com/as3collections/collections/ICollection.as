package com.as3collections.collections
{
	import com.as3collections.iterators.IIterator;
	import com.as3collections.visitors.IVisitor;
	
	/**
	 * Definition of what it means for an object to represent a collection of objects.
	 * 
	 * @author Michael Avila
	 */
	public interface ICollection
	{
		/**
		 * How many items exist within the collection.
		 */
		function get count():uint;
		/**
		 * Whether or not this collection is empty.
		 */
		function get isEmpty():Boolean;
		
		/**
		 * Allows a visitor object to pass over each item in the collection.
		 */
		function accept( visitor:IVisitor ):void;
		/**
		 * Removes all items from the collection.
		 */
		function clear():void;
		
		/**
		 * The iterator used to handle going through the collection.
		 */
		function getIterator():IIterator;
	}
}