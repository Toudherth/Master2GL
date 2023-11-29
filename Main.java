package qengine.program;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.jena.base.Sys;
import org.eclipse.rdf4j.model.Value;
import org.eclipse.rdf4j.query.algebra.Projection;
import org.eclipse.rdf4j.query.algebra.StatementPattern;
import org.eclipse.rdf4j.query.algebra.Var;
import org.eclipse.rdf4j.query.algebra.helpers.AbstractQueryModelVisitor;
import org.eclipse.rdf4j.query.algebra.helpers.StatementPatternCollector;
import org.eclipse.rdf4j.query.parser.ParsedQuery;
import org.eclipse.rdf4j.query.parser.sparql.SPARQLParser;
import org.eclipse.rdf4j.rio.RDFFormat;
import org.eclipse.rdf4j.rio.RDFParser;
import org.eclipse.rdf4j.rio.Rio;
import qengine.program.dectionnaire.Dictionnary;
import qengine.program.queryengines.QEngine;

import javax.net.ssl.HandshakeCompletedEvent;

/**
 * Programme simple lisant un fichier de requête et un fichier de données.
 * 
 * <p>
 * Les entrées sont données ici de manière statique,
 * à vous de programmer les entrées par passage d'arguments en ligne de commande comme demandé dans l'énoncé.
 * </p>
 * 
 * <p>
 * Le présent programme se contente de vous montrer la voie pour lire les triples et requêtes
 * depuis les fichiers ; ce sera à vous d'adapter/réécrire le code pour finalement utiliser les requêtes et interroger les données.
 * On ne s'attend pas forcémment à ce que vous gardiez la même structure de code, vous pouvez tout réécrire.
 * </p>
 * 
 * @author Olivier Rodriguez <olivier.rodriguez1@umontpellier.fr>
 */
public final class Main {
	static final String baseURI = null;

	/**
	 * Votre répertoire de travail où vont se trouver les fichiers à lire
	 */
	static final String workingDir = "data/";
	/**
	 * Fichier contenant les requêtes sparql
	 */
	static final String queryFile = workingDir + "sample_query.queryset";

	/**
	 * Fichier contenant des données rdf
	 */
	public static final String dataFile = workingDir + "sample_data.nt";
//	public static final String dataFile = workingDir + "100K.nt";

	// map
	private static Map<Integer, String> dictionary = new HashMap<>();
	private static Map<String, Integer> dictionaryValueKey = new HashMap<>();
	private static HexastoreIndex hexastoreIndex = new HexastoreIndex(dictionary);
	private static  MainRDFHandler mainRDFHandler= new MainRDFHandler();

	/**
	 * Echauffement du systeme avec x% de requettes prises au hazard
	 */
	static int warm = 0;


	public static void main(String []args) throws IOException {
		System.out.println(" je suis dans le nouveau main ");

		System.out.println("QEngine parsing data.");
		/** recuperation des données de la bd */

		QEngine.parseData();

		ArrayList<String> queries = parseQueries();
		//if (warm > 0) {
		//	System.out.println("QEngine warming with "+ warm +" queries"); }
		for(int i=0; i<=warm; i++) {

			String qu = queries.get(new Random().nextInt(queries.size()));
			QEngine.processAQuery(qu) ;

			System.out.println(QEngine.processAQuery(qu) );

		}


		Dictionnary.getInstance().saveDictionnary();
	}
	/**
	 * Méthode utilisée ici lors du parsing de requête sparql pour agir sur l'objet obtenu.
	 */

	public static void processAQuery(ParsedQuery query) {
		List<StatementPattern> patterns = StatementPatternCollector.process(query.getTupleExpr());
		Set<String> results= new LinkedHashSet<>();
		Set<String> result1s= new LinkedHashSet<>();
		for(StatementPattern pattern : patterns){
			Value subject = pattern.getSubjectVar().getValue();
			Value predicat = pattern.getPredicateVar().getValue();
			Value object= pattern.getObjectVar().getValue();
			/** utilisation de OPS| POS : */
			if(subject == null) {
				String predicats = predicat.stringValue();
				String objects = object.stringValue();
				/*	Set<String> map= hexastoreIndex.findLeaf1(hexastoreIndex.getPosIndexl(), hexastoreIndex.getIdOfString(dictionary , predicats),hexastoreIndex.getIdOfString( dictionary, objects) )
							.stream()
							.mapToInt(i ->hexastoreIndex.getStringOfId(dictionary, i)).collect(Collectors.toSet());
					*/
				/**For collection POS : */
				Set<String> mapPOS = hexastoreIndex.findLeaf(dictionary, hexastoreIndex.getPosIndexl(),predicats, objects );
				//.stream().map(i -> hexastoreIndex.getValueOfKey(i) ).collect(Collectors.toSet());*/
				/**For collection OPS : */
				Set<String> mapOPS = hexastoreIndex.findLeaf(dictionary, hexastoreIndex.getOpsIndexl(),objects, predicats );


				if (result1s.isEmpty()) {
					result1s.addAll(mapPOS);

				} else {
				//System.out.println(results.contains(mapOPS));
				for (String i : result1s){
					if(mapOPS.contains(i)){
						results.add(i);
					}
				//	System.out.println(" je suis dnas la boucle ");
				////	System.out.println(i );
				}}
				/*if(results.contains(mapOPS)){
					results.retainAll(mapPOS);
					//results.retainAll(mapOPS);
					System.out.println("La liste is not empty ");
					System.out.println(results);
				}*/
				System.out.println(results);
			}
		}
	}

	/**
	 * Entrée du programme
	 */



	public static void main1(String[] args) throws Exception {
		// La partie 1

		parseData(dictionary, dictionaryValueKey, hexastoreIndex);

	/*	System.out.println("Contenu de la HashMap Dictionnaire<Key, Value>  :");
		for (Integer key : dictionary.keySet()) {
			String value = dictionary.get(key);
			System.out.println("Clé : " + key + ", Valeur : " + value);

		}

		System.out.println("Contenu de la HashMap DictionnaireValeuKey<Value, Key>  :");
		for (String value : dictionaryValueKey.keySet()) {
			Integer key = dictionaryValueKey.get(value);
			System.out.println("Clé : " + value + ", Valeur : " + key);
		}*/
		System.out.println();
	/*	System.out.println("L'indexation des données de dictionnaire : ");
		// Affichage de la structure de la Map après l'ajout des triplets
		hexastoreIndex.printIndexTree("spoIndex", hexastoreIndex.getSpoIndexl());
		hexastoreIndex.printIndexTree("psoIndex", hexastoreIndex.getPsoIndexl());
		hexastoreIndex.printIndexTree("ospIndex", hexastoreIndex.getOspIndexl());
		hexastoreIndex.printIndexTree("sopIndex", hexastoreIndex.getSopIndexl());
		hexastoreIndex.printIndexTree("posIndex", hexastoreIndex.getPosIndexl());
		hexastoreIndex.printIndexTree("opsIndex", hexastoreIndex.getOpsIndexl());

*/
		System.out.println("Collection of Evaluation Query POS/OPS : ");
		parseQueries();



	}

	// ========================================================================

	/**
	 * Traite chaque requête lue dans {@link #queryFile} avec {@link #processAQuery(ParsedQuery)}.
	 */
	private static void parseQueries1() throws FileNotFoundException, IOException {
		/**
		 * Try-with-resources
		 * 
		 * @see <a href="https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html">Try-with-resources</a>
		 */
		/*
		 * On utilise un stream pour lire les lignes une par une, sans avoir à toutes les stocker
		 * entièrement dans une collection.
		 */
		try (Stream<String> lineStream = Files.lines(Paths.get(queryFile))) {
			SPARQLParser sparqlParser = new SPARQLParser();
			Iterator<String> lineIterator = lineStream.iterator();

			StringBuilder queryString = new StringBuilder();

			while (lineIterator.hasNext())
			/*
			 * On stocke plusieurs lignes jusqu'à ce que l'une d'entre elles se termine par un '}'
			 * On considère alors que c'est la fin d'une requête
			 */
			{
				String line = lineIterator.next();
				queryString.append(line);

				if (line.trim().endsWith("}")) {
					ParsedQuery query = sparqlParser.parseQuery(queryString.toString(), baseURI);

					processAQuery(query); // Traitement de la requête, à adapter/réécrire pour votre programme

					queryString.setLength(0); // Reset le buffer de la requête en chaine vide
				}
			}
		}
	}

	/**
	 * Traite chaque triple lu dans {@link #dataFile} avec {@link MainRDFHandler}.
	 */

	private static void parseData(Map<Integer, String> dictionary, Map<String, Integer> dictionaryValueKey, HexastoreIndex hexastoreIndex)
			throws FileNotFoundException, IOException {

		try (Reader dataReader = new FileReader(dataFile)) {
			// On va parser des données au format ntriples
			RDFParser rdfParser = Rio.createParser(RDFFormat.NTRIPLES);

			// On utilise notre implémentation de handler
			rdfParser.setRDFHandler(new MainRDFHandler(dictionary,dictionaryValueKey, hexastoreIndex));

			// Parsing et traitement de chaque triple par le handler
			rdfParser.parse(dataReader, baseURI);
		}
	}


	public static long timeReadingQueries;
	public static ArrayList<String> parseQueries() throws IOException {
		ArrayList<String> queries = new ArrayList<>();
		long startTime = System.currentTimeMillis();
		try (Stream<String> lineStream = Files.lines(Paths.get(queryFile))) {
			Iterator<String> lineIterator = lineStream.iterator();
			StringBuilder queryString = new StringBuilder();

			while (lineIterator.hasNext()) {
				String line = lineIterator.next();
				queryString.append(line);

				if (line.trim().endsWith("}")) {
					queries.add(queryString.toString());
					queryString.setLength(0);
				}
			}
		}
		long endTime = System.currentTimeMillis();
		timeReadingQueries = (endTime - startTime);
		return queries;
	}






}
