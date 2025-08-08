using OllamaSharp; // Import the OllamaSharp namespace

namespace OllamaSharpExample
{
	class Program
	{
		static async Task Main(string[] args)
		{
			// See https://aka.ms/new-console-template for more information
			Console.WriteLine("Hello, World!");

			// Ensure Ollama is running and a model is available (e.g., 'llama2')
			// Ollama typically runs on http://localhost:11434 by default.
			var uri = new Uri("http://localhost:11434");
			var ollama = new OllamaApiClient(uri);

			// Select the model to use for the conversation
			string modelName = "llama3.1:latest"; // Replace with your desired model // llama2 / llama3.1:latest  // llama3.1:8b

			Console.WriteLine($"Chatting with model: {modelName}");

			// Create a chat instance
			var chat = new Chat(ollama, modelName);
			//var chat = new Chat(ollama);
			chat.Model = modelName;

			while (true)
			{
				Console.Write("You: ");
				string userPrompt = Console.ReadLine();

				if (string.IsNullOrWhiteSpace(userPrompt))
					break;

				// Send the user's message and get the AI's response
				Console.Write("AI: ");
				await foreach (var responsePart in chat.SendAsync(userPrompt))
				{
					Console.Write(responsePart);
				}
				Console.WriteLine(); // New line after AI response
			}
		}
	}
}