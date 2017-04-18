package tmdt.web.controller;


import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import tmdt.web.entity.Cart;
import tmdt.web.entity.Items;
import tmdt.web.entity.OtherDAO;
import tmdt.web.entity.ProductDAO;
import tmdt.web.entity.User;
import tmdt.web.entity.product;


@Controller
public class MainController {

    
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public ModelAndView getPages(HttpServletRequest request) {
            request.setAttribute("productList", new ProductDAO().getSaleProduct());
            ModelAndView model = new ModelAndView("index");
            return model;
	}
        
        @RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView getAdminPages() {

		
		return  new ModelAndView("admin"); 

	}
        
        
        @RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLoginForm(HttpServletRequest request,Model m) {
            if(request.getSession().getAttribute("user")==null){
                m.addAttribute("root","Login");
		return "login";}
            else return "redirect:";

	}
        
        @RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView getRegForm() {

		ModelAndView model = new ModelAndView("register");
                model.addObject("root","Register");
		return model;

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
            request.getSession().invalidate();
		ModelAndView model = new ModelAndView("redirect:");
		return model;

	}
        
        
        @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public String addCart(@RequestParam String id,@RequestParam String quantity, HttpServletRequest request) {
            Cart c = (Cart) request.getSession(true).getAttribute("Cart");
            if(c==null){
                c = new Cart();
                request.getSession(true).setAttribute("Cart", c);
            }
            product p = new ProductDAO().getProductToCart(id);
            ArrayList<Items> I = c.getC();
            Items i = new Items(p, Integer.parseInt(quantity));
            int flag=0;
            for(Items j:I){
                if(j.getP().getId()==i.getP().getId()) {
                    j.setN(j.getN()+i.getN());
                        flag=1;
                        break;
                    }
                }
            if(flag==0) I.add(i);
            return "cart";
	}
        
        @RequestMapping(value = "/removeItem", method = RequestMethod.POST)
        public String remove(@RequestParam String index,HttpServletRequest request){
            Cart c = (Cart) request.getSession().getAttribute("Cart");
            c.getC().remove(Integer.parseInt(index));
            return "cart";
        }
        
        @RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(HttpServletRequest request, Model m) {
            try{
            m.addAttribute("root","Product Details");
            String id =  request.getParameter("id");
            product p = new ProductDAO().getProduct(id);
            request.setAttribute("p", p);
            User u = (User) request.getSession().getAttribute("user");
            String user = new OtherDAO().getUserTheSame(u, p);
            if(user.length()==0) {
                User u1 = null;
                user = new OtherDAO().getUserTheSame(u1, p);
            }

                System.out.println(user);
            if(user.length()==0) m.addAttribute("mes","Be First Person Buy It!");
            else{
                ArrayList<product> A = new ProductDAO().getReccomendProduct(u,user,p);
                if(A.isEmpty()) m.addAttribute( "mes","Do You Like It");
                else
                request.setAttribute("recommend",A);
                System.out.println(A.size());
            }
            return  "productdetail";}
            catch(Exception e){
                e.printStackTrace();
                return "error";
            }
	}
        
        
        
        
        @RequestMapping(value="/search",method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request){
            try{
            String page = request.getParameter("page");
            String search = request.getParameter("search");
            String description = request.getParameter("description");
            String ageFilter = request.getParameter("ageFilter");
            String categoryId = request.getParameter("categoryId");
            String sort = request.getParameter("sort");
            if(search==null) search ="";
            String uri = request.getRequestURL()+"?search="+search;
            if(description==null) description =""; else uri+="&description=true";
            if(ageFilter==null) ageFilter="";
            else
            if(Integer.parseInt(ageFilter)==1) {
                ageFilter=" and av.attri_value <='2'";
                uri+="&ageFilter=1";
            }
            else
            if(Integer.parseInt(ageFilter)==2) {
                uri+="&ageFilter=2";
                ageFilter=" and av.attri_value >'2' and av.attri_value <'5'";
            }
            else
            if(Integer.parseInt(ageFilter)==3) {
                uri+="&ageFilter=3";
                ageFilter=" and av.attri_value >='5'";
            }
            else ageFilter ="";
            if(categoryId==null) categoryId=""; else uri+="&categoryId="+categoryId;
            String orderBy="";
            String url = uri;
            model.addAttribute("url",url);
            if(sort==null) {
                orderBy="";
                sort="";
            } else{
                uri+="&sort="+sort;
            if(sort.equalsIgnoreCase("nameASC")) orderBy =" p.name ASC";
            else 
                if (sort.equalsIgnoreCase("nameDESC")) orderBy =" p.name DESC";
            else 
                if(sort.equalsIgnoreCase("priceASC")) orderBy =" p.price ASC";
            else 
                if(sort.equalsIgnoreCase("priceDESC"))orderBy =" p.price DESC";
            else 
                if(sort.equalsIgnoreCase("ratingUp")) orderBy =" score ASC" ;
            else 
                if(sort.equalsIgnoreCase("ratingDown")) orderBy ="score ASC";
            else orderBy ="";}
            if(page==null) page="1";
            int step = 4;
            int offset =(Integer.parseInt(page)-1)*step;
            int count  = new ProductDAO().getRowCount(search, description, ageFilter, categoryId, orderBy);
                System.out.println(count);
                if(count==0) {model.addAttribute("note","none");
                model.addAttribute("category", new OtherDAO().getCategory());}
                else{
            int maxPage = (int) Math.ceil((double) count/step);
            int currentPage = offset/step +1;
            int firstPage;
            int lastPage;
            if(maxPage <=7)  {
                firstPage =1;
                lastPage = maxPage;    
            } else {
                if(currentPage==1 || currentPage-4 <=1) {
                    firstPage =1;
                    lastPage = firstPage+7;
                } else
                if(currentPage==maxPage || currentPage +4 >=maxPage){
                    lastPage = maxPage;
                    firstPage = lastPage-7;
                } else{
                    firstPage = currentPage -4;
                    lastPage = firstPage+7;
                }
            }
            ArrayList<product> P = new ProductDAO().SearchProduct(search, description, ageFilter, categoryId, orderBy, offset, step);
            
                System.out.println(url+" "+uri);
                
            model.addAttribute("searchResult", P);
            model.addAttribute("category", new OtherDAO().getCategory());
            model.addAttribute("resultCount", count);
            model.addAttribute("firstPage", firstPage);
            model.addAttribute("lastPage",lastPage);
            model.addAttribute("currentPage", currentPage);
            model.addAttribute("maxPage", maxPage);
            model.addAttribute("steps",step);

            model.addAttribute("uri",uri);
            model.addAttribute("root","Search");
            model.addAttribute("search",search);
                }
            return "search";
            }catch (Exception e){
                e.printStackTrace();
                return "error";
            }
	}
        
        @RequestMapping(value ="/viewCart",method = {RequestMethod.GET,RequestMethod.POST})
        public String viewCart(HttpServletRequest request){
            request.setAttribute("root", "My Cart");
            return "cartList";
        }
        
        @RequestMapping(value ="/edit",method = RequestMethod.POST )
        public String editCart(HttpServletRequest request){
            try{
                Cart c = (Cart) request.getSession().getAttribute("Cart");
                for(int i =0; i<c.getC().size();i++){
                
                    int q = Integer.parseInt(request.getParameter("quanlity["+i+"]"));
                    c.getC().get(i).setN(q);
                }
                request.getSession().setAttribute("Cart", c);
                return "redirect:/viewCart";
            } catch(Exception e){
                e.printStackTrace();
                return "error";
            }

        }
        
        
        @RequestMapping(value="/updateRandR",method = RequestMethod.POST)
        public String updateRR(HttpServletRequest request){
            String review = request.getParameter("text");
            String rating = request.getParameter("rating");
            String id = request.getParameter("id");
            if(review.length()!=0) {
                new OtherDAO().addReview(review,id );
            }
            if(rating!=null){
                new OtherDAO().addRating(rating, id);
            }
            return "redirect:/view?id="+id;
        }
        
        @RequestMapping(value ="/checkout",method = {RequestMethod.GET,RequestMethod.POST})
        public String checkOut(HttpServletRequest request){
            request.setAttribute("root", "Check Out");
            if(request.getSession().getAttribute("user")==null){
             
                return "redirect:/login";
            } else{
            if(request.getSession().getAttribute("Cart")==null) return "redirect:/viewCart";
            else return "checkout";}
        }
        
        @RequestMapping(value ="/success",method = {RequestMethod.GET,RequestMethod.POST})
        public String success(HttpServletRequest request){
            request.setAttribute("root", "Success");
            return "success";
        }
        
        @RequestMapping(value ="/confirm",method = {RequestMethod.GET,RequestMethod.POST})
        public String confirm(HttpServletRequest request){
            new OtherDAO().addOrder((User)request.getSession().getAttribute("user"), (Cart)request.getSession().getAttribute("Cart"));
            new OtherDAO().addProductToOrder((Cart)request.getSession().getAttribute("Cart"));
            request.getSession().setAttribute("Cart",null );
            return "redirect:/success";
        }
        
}
