/*
 * Copyright : Strong Digital Technological Co., LTD.
 * All right reserved.
 * JDK 1.5.0_14;?Struts：2.1.2;Spring 2.5.6;?Hibernate： 3.3.1.GA
 * Create Date: 2008-12-13
 * Autour: zhangli
 * Version: V1.0
 * Description： 字典项树结构辅助类
 */
package com.strongit.oa.dict.dictItem;

import com.strongit.oa.bo.ToaSysmanageDictitem;
import com.strongit.tag.web.tree.IDealTreeNode;

public class DealTreeNode extends IDealTreeNode {

	public String getTagNodeId() {
		// TODO 自动生成方法存根
		return ((ToaSysmanageDictitem) obj).getDictItemCode();
	}

	public String getTagNodeName() {
		// TODO 自动生成方法存根
		return ((ToaSysmanageDictitem) obj).getDictItemShortdesc();
	}

	public String getTagParentId() {
		// TODO 自动生成方法存根
		return ((ToaSysmanageDictitem) obj).getDictItemParentvalue();
	}

	public String getNodeImg() {
		// TODO 自动生成方法存根
		return null;
	}

	@Override
	public String getUrl() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getClick() {
		// TODO Auto-generated method stub
		return null;
	}

}