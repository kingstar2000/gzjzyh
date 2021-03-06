/*
 * Copyright : Strong Digital Technological Co., LTD.
 * All right reserved.
 * JDK 1.5.0_14;?Struts：2.1.2;Spring 2.5.6;?Hibernate： 3.3.1.GA
 * Create Date: 2009-2-12
 * Autour: qindh
 * Version: V1.0
 * Description： 信息发布action
 */
package com.strongit.oa.wap;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletActionRedirectResult;
import org.springframework.beans.factory.annotation.Autowired;

import com.strongit.oa.bo.ToaInfopublishColumn;
import com.strongit.oa.bo.ToaInfopublishColumnArticl;
import com.strongit.oa.infopub.articles.ArticlesManager;
import com.strongit.oa.infopub.column.ColumnManager;
import com.strongit.oa.wap.util.Data;
import com.strongit.oa.wap.util.Item;
import com.strongit.oa.wap.util.Row;
import com.strongit.oa.wap.util.Status;
import com.strongmvc.orm.hibernate.Page;
import com.strongmvc.webapp.action.BaseActionSupport;

@ParentPackage("default")
@Results( { @Result(name = BaseActionSupport.RELOAD, value = "articles.action", type = ServletActionRedirectResult.class) })
public class ColumnArticlesAction extends
		BaseActionSupport<ToaInfopublishColumnArticl> {
	/** page对象* */
	private Page<ToaInfopublishColumnArticl> page = new Page<ToaInfopublishColumnArticl>(
			8, true);
	/** 栏目ID* */
	private String columnId;
	/** model* */
	private ToaInfopublishColumnArticl model = new ToaInfopublishColumnArticl();
	/** 文件Manager* */
	private ArticlesManager articlesManager;
	private String ArcticlesType;
	private String disLogo;
	/** 栏目Manager* */
	private ColumnManager columnManager;
	private Map ArcticlesTypeMap = new HashMap();
	private String articlesTitle;
	private String articlesAuthor;
	private String clumnName;
	private Date columnArticleLatestchangtime;
	private String showtype;
	private String promulgate;
	private String Hits;// 文章点击次数
	private int currentPage;
	private ToaInfopublishColumn column = null;

	public String getPromulgate() {
		return promulgate;
	}

	public void setPromulgate(String promulgate) {
		this.promulgate = promulgate;
	}

	/**
	 * 构造方法
	 * 
	 */
	ColumnArticlesAction() {
		ArcticlesTypeMap.put("0", "已删除");
		ArcticlesTypeMap.put("1", "未上栏");
		ArcticlesTypeMap.put("2", "未发布");
		ArcticlesTypeMap.put("3", "审核中");
		ArcticlesTypeMap.put("5", "已审核");
		ArcticlesTypeMap.put("9", "已发布");
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	@Override
	public String input() throws Exception {
		return null;
	}

	/**
	 * 此方法停用了,之前是获取所有分组的所有记录，现在需要分组，所以本方法停用
	 * @return
	 * @throws Exception
	 */
	public String androidlist()throws Exception{
		Data data=new Data();
		HttpServletRequest request = getRequest();
		try{
			currentPage=currentPage==0?1:currentPage;
			page.setPageNo(currentPage);
			
			page=articlesManager.getAndroidColumnArticlPagesByProcess(page, null);
			//return "promulgate";
			//StringBuffer html = new StringBuffer("");
			List<Row> rows=new ArrayList<Row>();
			for(int i=0;i<page.getResult().size();i++){
				ToaInfopublishColumnArticl b=new ToaInfopublishColumnArticl();
				b=page.getResult().get(i);
				String author=b.getToaInfopublishArticle().getArticlesAuthor();
				if(author==null){
					author="";
				}
				
				Row row=new Row();
				List<Item> items = new ArrayList<Item>();
				Item item=new Item();
				item.setType("");
				item.setValue(b.getColumnArticleId());
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(b.getToaInfopublishArticle().getArticlesTitle());
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(author);
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(b.getToaInfopublishColumn().getClumnName());
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(b.getColumnArticleLatestchangtime().toString());
				items.add(item);
				
				row.setItems(items);
				rows.add(row);
				//html.append("<data>"+b.getColumnArticleId()+","+b.getToaInfopublishArticle().getArticlesTitle()+","+author+","+b.getToaInfopublishColumn().getClumnName()+","+b.getColumnArticleLatestchangtime()+"</data>");
			}
			//getRequest().setAttribute("articles", html.toString());
			
			data.setRows(rows);
			Status status=new Status("0","success");
			com.strongit.oa.wap.util.Page itempage=new com.strongit.oa.wap.util.Page();
			itempage.setTotalPages(page.getTotalPages());
			itempage.setTotalCount(page.getTotalCount());
			data.setStatus(status);
			data.setPage(itempage);
			request.setAttribute("result", Data.GenerateJsonRowData(data));
		}catch(Exception e){
			String err=e.getMessage();
			Status status=new Status("1",err);
			data.setStatus(status);
			request.setAttribute("result", Data.GenerateJsonRowData(data));
		}
		
		return "androidlist";
	}
	
	public String androidsearch()throws Exception{
		Data data=new Data();
		HttpServletRequest request = getRequest();
		try{
			List<ToaInfopublishColumnArticl> list=new ArrayList<ToaInfopublishColumnArticl>();
			list=articlesManager.getColumnArticleTitleList(articlesTitle);
			//return "promulgate";
			//StringBuffer html = new StringBuffer("");
			List<Row> rows=new ArrayList<Row>();
			for(int i=0;i<list.size();i++){
				ToaInfopublishColumnArticl b=new ToaInfopublishColumnArticl();
				b=list.get(i);
				String author=b.getToaInfopublishArticle().getArticlesAuthor();
				if(author==null||"null".equals(author)){
					author="";
				}
				Row row=new Row();
				List<Item> items = new ArrayList<Item>();
				Item item=new Item();
				item.setType("");
				item.setValue(b.getColumnArticleId());
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(b.getToaInfopublishArticle().getArticlesTitle());
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(author);
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(b.getToaInfopublishColumn().getClumnName());
				items.add(item);
				
				item=new Item();
				item.setType("");
				item.setValue(b.getColumnArticleLatestchangtime().toString());
				items.add(item);
				
				row.setItems(items);
				rows.add(row);
				//html.append("<data>"+b.getColumnArticleId()+","+b.getToaInfopublishArticle().getArticlesTitle()+","+author+","+b.getToaInfopublishColumn().getClumnName()+","+b.getColumnArticleLatestchangtime()+"</data>");
			}
			data.setRows(rows);
			Status status=new Status("0","success");
			com.strongit.oa.wap.util.Page itempage=new com.strongit.oa.wap.util.Page();
			itempage.setTotalPages(page.getTotalPages());
			itempage.setTotalCount(page.getTotalCount());
			data.setStatus(status);
			data.setPage(itempage);
			request.setAttribute("result", Data.GenerateJsonRowData(data));
			//getRequest().setAttribute("articles", html.toString());
		}catch(Exception e){
			String err=e.getMessage();
			Status status=new Status("1",err);
			data.setStatus(status);
			request.setAttribute("result", Data.GenerateJsonRowData(data));
		}
		return "androidlist";
	}
	
	/**
	 * 获取上栏稿件列表
	 */
	@Override
	public String list() throws Exception {

		if (columnId != null) {
			column = columnManager.getColumn(columnId);
		}
		if ("0".equals(showtype)) {// 信息查询
			articlesManager.notStandtop();
			articlesManager.isStendTop();
			if (!"".equals(columnId) && columnId != null
					&& !"null".equals(columnId)) {// 根据条件搜索
				page = articlesManager.getSelectColumnAricesPagesVeiwWealth(
						page, articlesTitle, articlesAuthor, Hits,
						columnArticleLatestchangtime, disLogo, ArcticlesType,
						columnId);
			} else {
				page = articlesManager.getColumnArticlPagesVeiw(page,articlesTitle, articlesAuthor,Hits,
						 disLogo, ArcticlesType);// 查看已发布的稿件
			}

			List<ToaInfopublishColumnArticl> lst = page.getResult();// 获取List

			// 过滤不该上线的文章

			if (lst != null) {
				Date date = new Date();
				for (ToaInfopublishColumnArticl t : lst) {// 循环获取每个文章的评论量

					t.setCountComment(t.getToaInfopublishArticle()
							.getToaInfopublishComments().size());
				}
			}
			page.setResult(lst);
			return "showlist";
		} 
/*		else if (promulgate != null || "promulgate".equals(promulgate)) {// 判断是否是信息发布页面
			if (!"".equals(disLogo) && disLogo != null) {// 判断是否是根据条件搜索文章

				page = articlesManager.getSelectColumnAricesPagesWealth(page,
						articlesTitle, articlesAuthor, Hits,
						columnArticleLatestchangtime, disLogo, ArcticlesType,
						columnId);
			} else if (column != null && column.getProcessName() != null
					&& !"".equals(column.getProcessName()))// 判断栏目是否走了工作流
			{
				page = articlesManager.getColumnArticlPagesByProcess(page,
						columnId);
			} else {
				page = articlesManager.getColumnArticlPagesByState(page,
						columnId);
			}
			return "promulgate";
		} */
		else {// 以上
			if (!"".equals(disLogo) && disLogo != null) {// 判断是否是根据条件搜索文章
				if ("4".equals(ArcticlesType) || ArcticlesType == "4") {
					return renderHtml("<script>window.location = '"
							+ getRequest().getContextPath()
							+ "/infopub/articles/articles.action';</script>");
				}
				page = articlesManager.getSelectColumnAricesPagesWealth(page,
						articlesTitle, articlesAuthor, Hits,
						columnArticleLatestchangtime, disLogo, ArcticlesType,
						columnId);
			} else {
				page = articlesManager.getColumnArticlsBycId(page, columnId);
			}
			return SUCCESS;
		}

	}

	/**
	 * 信息发布列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String promulgate() throws Exception {
		if ("0".equals(showtype)) {
			if (!"".equals(disLogo) && disLogo != null) {
				page = articlesManager.getSelectColumnAricesPagesVeiw(page,
						articlesTitle, articlesAuthor, clumnName,
						columnArticleLatestchangtime, disLogo, ArcticlesType,
						columnId);
			} else {
				page = articlesManager.getColumnArticlPagesVeiw(page,articlesTitle, articlesAuthor,Hits,
						 disLogo, ArcticlesType);
			}
		} else {
			if (!"".equals(disLogo) && disLogo != null) {
				page = articlesManager.getSelectColumnAricesPages(page,
						articlesTitle, articlesAuthor, clumnName,
						columnArticleLatestchangtime, disLogo, ArcticlesType,
						columnId);
			} else {
				page = articlesManager.getColumnArticlPages(page, columnId);
			}
		}
		return "promulgate";
	}

	@Override
	protected void prepareModel() throws Exception {

	}

	@Override
	public String save() throws Exception {
		return null;
	}

	public ToaInfopublishColumnArticl getModel() {
		return model;
	}

	public Page<ToaInfopublishColumnArticl> getPage() {
		return page;
	}

	@Autowired
	public void setArticlesManager(ArticlesManager articlesManager) {
		this.articlesManager = articlesManager;
	}

	@Autowired
	public void setColumnManager(ColumnManager columnManager) {
		this.columnManager = columnManager;
	}

	public void setModel(ToaInfopublishColumnArticl model) {
		this.model = model;
	}

	public String getColumnId() {
		return columnId;
	}

	public void setColumnId(String columnId) {
		this.columnId = columnId;
	}

	public Map getArcticlesTypeMap() {
		return ArcticlesTypeMap;
	}

	public void setArcticlesTypeMap(Map arcticlesTypeMap) {
		ArcticlesTypeMap = arcticlesTypeMap;
	}

	public String getArcticlesType() {
		return ArcticlesType;
	}

	public void setArcticlesType(String arcticlesType) {
		ArcticlesType = arcticlesType;
	}

	public String getDisLogo() {
		return disLogo;
	}

	public void setDisLogo(String disLogo) {
		this.disLogo = disLogo;
	}

	public String getArticlesAuthor() {
		return articlesAuthor;
	}

	public void setArticlesAuthor(String articlesAuthor) {
		this.articlesAuthor = articlesAuthor;
	}

	public String getArticlesTitle() {
		return articlesTitle;
	}

	public void setArticlesTitle(String articlesTitle) {
		this.articlesTitle = articlesTitle;
	}

	public String getClumnName() {
		return clumnName;
	}

	public void setClumnName(String clumnName) {
		this.clumnName = clumnName;
	}

	public Date getColumnArticleLatestchangtime() {
		return columnArticleLatestchangtime;
	}

	public void setColumnArticleLatestchangtime(
			Date columnArticleLatestchangtime) {
		this.columnArticleLatestchangtime = columnArticleLatestchangtime;
	}

	public String getShowtype() {
		return showtype;
	}

	public void setShowtype(String showtype) {
		this.showtype = showtype;
	}

	public ToaInfopublishColumn getColumn() {
		return column;
	}

	public void setColumn(ToaInfopublishColumn column) {
		this.column = column;
	}

	public String getHits() {
		return Hits;
	}

	public void setHits(String hits) {
		Hits = hits;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}
