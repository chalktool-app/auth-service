package in.chalktool.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
class OAuth2SecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .exceptionHandling()
                .accessDeniedHandler((req, res, e) -> res.sendRedirect("/403"))

                .and().authorizeRequests()
                .antMatchers(HttpMethod.GET,"/", "/login", "/css/**", "/images/**").permitAll()
                .anyRequest().authenticated()

                // send the user back to the root page when they logout
                .and()
                .logout().logoutSuccessUrl("/")

                .and().oauth2Client()
                .and().oauth2Login().redirectionEndpoint()
                .baseUri("/authorization-code/callback*");
    }
}
