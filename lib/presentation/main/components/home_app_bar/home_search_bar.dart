part of 'home_app_bar.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: "Search for a product, cloth...",
      hintStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return const TextStyle(
            fontSize: 8, // Font size when focused
            color: Colors.blue, // Color when focused
          );
        }
        return const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF808c9d), // Default hint text color
        );
      }),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: MaterialStateProperty.all(Color(0xFFebeded)),
      trailing: const [
        Icon(
          Icons.search_outlined,
          color: Color(0xFF808c9d),
        )
      ],
    );
  }
}
