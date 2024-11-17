// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:buzz_recipe_viewer/data/repository/firestore/recipe_provider.dart';
import 'package:buzz_recipe_viewer/domain/model/recipe.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_notifier.dart';
import 'package:buzz_recipe_viewer/ui/recipe/recipe_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flutter_test_config.dart';

void main() {
  final emptyDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          recipeWindowNotifierProvider
              .overrideWith(RecipeWindowNotifierMock.new),
          recipeStreamProvider.overrideWith(
            (ref) => Stream.value((recipes: [], hasReachedEnd: true)),
          ),
        ],
        child: const RecipePage(),
      ),
    );

  final englishRecipeDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          recipeWindowNotifierProvider
              .overrideWith(RecipeWindowNotifierMock.new),
          recipeStreamProvider
              .overrideWith((ref) => Stream.value(FakeRecipe.en())),
        ],
        child: const RecipePage(),
      ),
    );

  final japaneseRecipeDeviceBuilder = DeviceBuilder()
    ..addScenario(
      widget: ProviderScope(
        overrides: [
          recipeWindowNotifierProvider
              .overrideWith(RecipeWindowNotifierMock.new),
          recipeStreamProvider
              .overrideWith((ref) => Stream.value(FakeRecipe.ja())),
        ],
        child: const RecipePage(),
      ),
    );

  group('recipe_note', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/empty',
      );
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(emptyDeviceBuilder, wrapper: wrapper);
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/empty',
      );
    });
  });

  group('list', () {
    testGoldens('ja', (tester) async {
      const locale = AppLocale.ja;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(
        japaneseRecipeDeviceBuilder,
        wrapper: wrapper,
      );
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/list',
      );
    });

    testGoldens('en', (tester) async {
      const locale = AppLocale.en;
      // await LocaleSettings.setLocale(locale);
      await tester.pumpDeviceBuilder(
        englishRecipeDeviceBuilder,
        wrapper: wrapper,
      );
      await screenMatchesGolden(
        tester,
        '${locale.languageCode}/recipe_note/list',
      );
    });
  });
}

class FakeRecipe {
  static ({List<Recipe> recipes, bool hasReachedEnd}) ja() {
    final now1 = DateTime.now();
    final recipe1 = Recipe(
      recipeId: RecipeId('1'),
      title: '星空のフルーツタルト',
      description:
          'このレシピでは、真夜中の星空をイメージした美しいフルーツタルトを作ります。ブルーベリーや黒ぶどうなどの深い色合いのフルーツと、キウイやグリーンアップルなどの鮮やかなフルーツを組み合わせて、美味しくも美しいタルトを作り上げます。',
      foodList: [
        'タルト生地 - 1枚',
        'カスタードクリーム - 500g',
        '黒ぶどう - 200g',
        'キウイ - 2個',
        'グリーンアップル - 1個',
        'ゼラチン - 10g',
        '水 - 100ml',
        '砂糖 - 50g',
        'レモン汁 - 大さじ1',
        '銀色の食用スプレー - 適量',
      ],
      stepList: [
        'タルト生地を予熱したオーブン180℃で20分程度焼きます。',
        'キウイとグリーンアップルは小さな星型にカットします。ブルーベリーと黒ぶどうは半分に切ります。',
        'カスタードクリームを焼いたタルト生地に均一に広げます。',
        'ブルーベリーと黒ぶどうをタルト上に散りばめ、キウイとグリーンアップルの星型をデコレーションします。',
        'ゼラチンを水で戻し、砂糖とレモン汁を加えてからレンジで溶かします。溶かしたゼラチン液をフルーツの上にゆっくりと流します。',
        'ゼラチンが固まるまで冷蔵庫で冷やします。',
        '銀色の食用スプレーを軽く吹きかけて、星空のような輝きを出します。',
      ],
      imageList: [],
      createdAt: now1,
      updatedAt: now1,
    );

    final now2 = DateTime.now();
    final recipe2 = Recipe(
      recipeId: RecipeId('2'),
      title: '砂漠のミラージュカクテル',
      description:
          'このレシピでは、砂漠とミラージュをテーマにしたエキゾチックなカクテルを作ります。さっぱりとした味わいと美しい色彩が特徴です。',
      foodList: [
        'テキーラ - 60ml',
        'ブルーキュラソー - 30ml',
        'レモンジュース - 30ml',
        'サイダー - 適量',
        '氷 - 適量',
        'レモンスライス - 1枚',
      ],
      stepList: [
        'シェーカーにテキーラ、ブルーキュラソー、レモンジュース、氷を入れてよく振ります。',
        'カクテルグラスに注ぎ、サイダーで満たします。',
        '最後にレモンスライスを添えて完成です。',
      ],
      imageList: [],
      createdAt: now2,
      updatedAt: now2,
    );

    final now3 = DateTime.now();
    final recipe3 = Recipe(
      recipeId: RecipeId('3'),
      title: 'レインボーベジタブルピザ',
      description: '色とりどりの野菜を使って虹色に彩られたヘルシーピザを作ります。見た目も楽しく、栄養満点のピザです。',
      foodList: [
        'ピザ生地 - 1枚',
        'ピザソース - 200g',
        'モッツァレラチーズ - 200g',
        '赤パプリカ - 1個',
        'オレンジパプリカ - 1個',
        '黄パプリカ - 1個',
        '緑パプリカ - 1個',
        '紫キャベツ - 100g',
        'オリーブオイル - 大さじ1',
        '塩と黒胡椒 - 適量',
      ],
      stepList: [
        '各パプリカと紫キャベツを薄切りにします。',
        'ピザ生地にピザソースを塗り、モッツァレラチーズを均等に散らします。',
        'パプリカと紫キャベツを虹の色順にピザ生地の上に並べます。',
        'オリーブオイルを全体にかけ、塩と黒胡椒で味を調えます。',
        '予熱したオーブンで200℃で15分、またはチーズが溶けて軽く焦げ目がつくまで焼きます。',
      ],
      imageList: [],
      createdAt: now3,
      updatedAt: now3,
    );
    return (recipes: [recipe1, recipe2, recipe3], hasReachedEnd: true);
  }

  static ({List<Recipe> recipes, bool hasReachedEnd}) en() {
    final now1 = DateTime.now();
    final recipe1 = Recipe(
      recipeId: RecipeId('1'),
      title: 'Starry Fruit Tart',
      description:
          'In this recipe, we will make a beautiful fruit tart inspired by the midnight sky. We will combine deep-colored fruits like blueberries and black grapes with vibrant fruits like kiwi and green apple to create a delicious and visually stunning tart.',
      foodList: [
        'Tart crust - 1 sheet',
        'Custard cream - 500g',
        'Black grapes - 200g',
        'Kiwi - 2 pieces',
        'Green apple - 1 piece',
        'Gelatin - 10g',
        'Water - 100ml',
        'Sugar - 50g',
        'Lemon juice - 1 tablespoon',
        'Edible silver spray - as needed',
      ],
      stepList: [
        'Preheat the oven to 180°C and bake the tart crust for about 20 minutes.',
        'Cut the kiwi and green apple into small star shapes. Cut the blueberries and black grapes in half.',
        'Spread the custard cream evenly on the baked tart crust.',
        'Decorate the tart with the blueberries and black grapes, and the star-shaped kiwi and green apple.',
        'Soak the gelatin in water, then add sugar and lemon juice and melt in the microwave. Slowly pour the melted gelatin mixture over the fruits.',
        'Chill in the refrigerator until the gelatin sets.',
        'Lightly spray the tart with edible silver spray to create a starry effect.',
      ],
      imageList: [],
      createdAt: now1,
      updatedAt: now1,
    );

    final now2 = DateTime.now();
    final recipe2 = Recipe(
      recipeId: RecipeId('2'),
      title: 'Desert Mirage Cocktail',
      description:
          'In this recipe, we will make an exotic cocktail inspired by the desert and mirages. It has a refreshing taste and beautiful colors.',
      foodList: [
        'Tequila - 60ml',
        'Blue Curacao - 30ml',
        'Lemon juice - 30ml',
        'Cider - as needed',
        'Ice - as needed',
        'Lemon slice - 1 piece',
      ],
      stepList: [
        'In a shaker, combine tequila, blue curacao, lemon juice, and ice. Shake well.',
        'Pour into a cocktail glass and top with cider.',
        "Garnish with a lemon slice and it's ready to serve.",
      ],
      imageList: [],
      createdAt: now2,
      updatedAt: now2,
    );

    final now3 = DateTime.now();
    final recipe3 = Recipe(
      recipeId: RecipeId('3'),
      title: 'Rainbow Vegetable Pizza',
      description:
          'In this recipe, we will make a healthy pizza that is colorful and vibrant using a variety of vegetables. It is not only visually appealing but also packed with nutrients.',
      foodList: [
        'Pizza dough - 1 sheet',
        'Pizza sauce - 200g',
        'Mozzarella cheese - 200g',
        'Red bell pepper - 1 piece',
        'Orange bell pepper - 1 piece',
        'Yellow bell pepper - 1 piece',
        'Green bell pepper - 1 piece',
        'Purple cabbage - 100g',
        'Olive oil - 1 tablespoon',
        'Salt and black pepper - as needed',
      ],
      stepList: [
        'Slice each bell pepper and purple cabbage thinly.',
        'Spread pizza sauce on the pizza dough and sprinkle mozzarella cheese evenly.',
        'Arrange the bell peppers and purple cabbage on the pizza dough in rainbow order.',
        'Drizzle olive oil over the pizza and season with salt and black pepper.',
        'Bake in a preheated oven at 200°C for 15 minutes or until the cheese melts and lightly browns.',
      ],
      imageList: [],
      createdAt: now3,
      updatedAt: now3,
    );
    return (recipes: [recipe1, recipe2, recipe3], hasReachedEnd: true);
  }
}
