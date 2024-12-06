package hcmute.edu.vn.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter{
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/*", "user.jsp")
		.addDecoratorPath("/user/*", "user.jsp")
		.addDecoratorPath("/vendor/*", "vendor.jsp")
		.addDecoratorPath("/admin/*", "admin.jsp")
		.addExcludedPath("/login*").addExcludedPath("/login/*")
		.addExcludedPath("/register*").addExcludedPath("/register/*")
		.addExcludedPath("/forgotPassword*").addExcludedPath("/forgotPassword/*")
//		.addExcludedPath("/admin*").addExcludedPath("/admin/*")
		.addExcludedPath("/api/**").addExcludedPath("/api/**");
	}
}
