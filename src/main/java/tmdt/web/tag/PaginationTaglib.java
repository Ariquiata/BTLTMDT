/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tmdt.web.tag;
import java.io.Writer;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
/**
 *
 * @author Saber
 */
public class PaginationTaglib extends SimpleTagSupport{
    private String uri;
	private int maxPage;
	private int steps = 8;
	private String previous = "<";
	private String next = ">";
        private String first ="<|";
        private String last ="|>";
        private int pageStart;
        private int pageEnd;
        private int currentPage;
	private Writer getWriter() {
		JspWriter out = getJspContext().getOut();
		return out;
	}

	@Override
	public void doTag() throws JspException {
		Writer out = getWriter();
                
		try {
			out.write("<ul class=\"pagination\">");
			if(pageStart !=1 ) {
                            out.write(constructLink(1, first,null));
                            
                        }
                        if(currentPage!=pageStart) out.write(constructLink(currentPage-1, previous,null));
			for(int itr=pageStart;itr<=pageEnd;itr++) {
				if(currentPage==itr)
					out.write(constructLink(itr, String.valueOf(itr), "active"));
				else
					out.write(constructLink(itr, String.valueOf(itr), null ));
			}
                        if(currentPage != pageEnd)                            out.write(constructLink(currentPage+1,next,null));
			if(pageEnd != maxPage){

                            out.write(constructLink(maxPage, last,null));
                        }	
			out.write("</ul>");
		} catch (Exception ex) {
			                 System.out.println(ex.getMessage());;
		}
	}


	private String constructLink(int page, String text, String className) {
		StringBuilder link = new StringBuilder("<li");
		if (className != null) {
			link.append(" class=\"");
			link.append(className);
			link.append("\"");
                        link.append(">").append("<span>"+text+"</span></li>");
		}
		else
			link.append(">").append("<a href=\""+uri+"&page="+page + "\">"+text+"</a></li>");
		return link.toString();
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public int getSteps() {
        return steps;
    }

    public void setSteps(int steps) {
        this.steps = steps;
    }

    public String getPrevious() {
        return previous;
    }

    public void setPrevious(String previous) {
        this.previous = previous;
    }

    public String getNext() {
        return next;
    }

    public void setNext(String next) {
        this.next = next;
    }

    public String getFirst() {
        return first;
    }

    public void setFirst(String first) {
        this.first = first;
    }

    public String getLast() {
        return last;
    }

    public void setLast(String last) {
        this.last = last;
    }

    public int getPageStart() {
        return pageStart;
    }

    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

	
        
}
