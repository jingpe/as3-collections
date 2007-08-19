package com.as3collections.trees
{
	import com.as3collections.collections.ICollection;
	
	public interface ITree extends ICollection
	{
		function get key():Object;
		
		function get isLeaf():Boolean;
		function get children():uint;
		
		function getChildTree( index:int ):ITree;
		
		function breadthFirstTraversal( visitor:IVisitor ):void;
		function depthFirstTraversal( visitor:IPrePostVisitor ):void;
	}
}