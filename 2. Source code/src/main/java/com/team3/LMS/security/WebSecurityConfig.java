package com.team3.LMS.security;

import com.team3.LMS.authentication.MyDBAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
 
@Configuration
// @EnableWebSecurity = @EnableWebMVCSecurity + Extra features
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
 
  
   @Autowired
   MyDBAuthenticationService myDBAauthenticationService;
 
   @Autowired
   public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

       auth.inMemoryAuthentication().withUser("user1").password("12345").roles("MEMBER_USER");
       auth.inMemoryAuthentication().withUser("admin1").password("12345").roles("ADMIN");

       auth.userDetailsService(myDBAauthenticationService);
 
   }
 
   @Override
   protected void configure(HttpSecurity http) throws Exception {
 
       http.csrf().disable();
  
       http.authorizeRequests().antMatchers("/", "/home", "/login", "/logout", "/book").permitAll();
  
       http.authorizeRequests().antMatchers("/userInfo").access("hasAnyRole('MEMBER_USER', 'ADMIN')");
 
       // For ADMIN only
       http.authorizeRequests().antMatchers("/admin").access("hasRole('ADMIN')");
 
       http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
 
       http.authorizeRequests().and().formLogin()//
  
               .loginProcessingUrl("/j_spring_security_check") // Submit URL
               .loginPage("/login")
               .defaultSuccessUrl("/userInfo")
               .failureUrl("/login?error=true")
               .usernameParameter("username")
               .passwordParameter("password")
               .and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful");
 
   }
}