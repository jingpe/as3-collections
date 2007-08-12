package com.as3collections.core
{
	/**
	 * Our definition of a collection of objects.  If something is a collection of items, we should be able to count those
	 * items, know if it is empty, remove all of the items, iterate over all of the items, and also pass a visitor over the items in the collection.
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