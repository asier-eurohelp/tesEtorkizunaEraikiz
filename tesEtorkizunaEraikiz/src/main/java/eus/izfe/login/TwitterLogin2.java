package eus.izfe.login;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

import org.junit.Test;

import com.twitter.hbc.ClientBuilder;
import com.twitter.hbc.core.Client;
import com.twitter.hbc.core.Constants;
import com.twitter.hbc.core.endpoint.StatusesSampleEndpoint;
import com.twitter.hbc.core.processor.StringDelimitedProcessor;
import com.twitter.hbc.httpclient.auth.Authentication;
import com.twitter.hbc.httpclient.auth.BasicAuth;

public class TwitterLogin2 {

String STREAM_HOST = "https://api.twitter.com/oauth/authenticate";

	@Test
	public void connect() {

		String consumerKey = "XXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		String consumerSecret = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		String token = "XXXXXX@gmail.com";
		String secret = "XXXXXXXX";
		String user = "XXXXXXX@gmail.com";
		String password = "XXXXX";

		// Create an appropriately sized blocking queue
		BlockingQueue<String> msgQueue = new LinkedBlockingQueue<String>(10000);
		// Authenticate via OAuth
		// Authentication auth = new OAuth1(consumerKey, consumerSecret, token, secret);
		Authentication auth = new BasicAuth(user, password);

		// Build a hosebird client
		ClientBuilder builder = new ClientBuilder().hosts(STREAM_HOST).authentication(auth)
				.endpoint(new StatusesSampleEndpoint()).processor(new StringDelimitedProcessor(msgQueue))
		// .eventMessageQueue(queue)
		;
		Client hosebirdClient = builder.build();

		// on a different thread, or multiple different threads....
		while (!hosebirdClient.isDone()) {
			try {
				String msg = msgQueue.take();
				System.out.println(msg);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
