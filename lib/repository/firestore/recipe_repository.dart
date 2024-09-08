import 'package:buzz_recipe_viewer/model/recipe.dart';
import 'package:buzz_recipe_viewer/repository/firestore/recipe_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_repository.g.dart';

@riverpod
RecipeRepository recipeRepository(RecipeRepositoryRef ref) =>
    RecipeRepository(ref);

class RecipeRepository {
  RecipeRepository(this._ref);
  final RecipeRepositoryRef _ref;

  // create
  Future<String> create(Recipe recipe) async {
    final docRef = await _ref.read(recipeCollectionProvider).add(recipe);
    return docRef.id;
  }

  // update
  Future<void> update(Recipe recipe) async {
    await _ref
        .read(recipeDocumentProvider(recipe.id!))
        .set(recipe, SetOptions(merge: true));
  }

  // delete
  Future<void> delete(Recipe recipe) async {
    await _ref.read(recipeDocumentProvider(recipe.id!)).delete();
  }

  // delete all
  Future<void> deleteAll() async {
    final batch = FirebaseFirestore.instance.batch();
    final snapshot = await _ref.read(recipeQueryProvider).get();
    snapshot.docs.map((doc) => doc.reference).forEach(batch.delete);
    await batch.commit();
  }
}

extension RecipeRepositoryDebug on RecipeRepository {
  Future<void> createDummyData() async {
    final start = DateTime.now();
    final batch = FirebaseFirestore.instance.batch();
    final collection = _ref.read(recipeCollectionProvider);
    List.generate(30, (index) => index).map((index) {
      final now = start.add(Duration(seconds: index));
      final recipe = Recipe(
        title: '$index',
        description: '$index',
        foodList: [
          '$index',
        ],
        stepList: [
          '$index',
        ],
        createdAt: now,
        updatedAt: now,
      );
      final docRef = collection.doc();
      batch.set(docRef, recipe);
    }).toList();
    await batch.commit();
  }

  Future<void> addSampleData() async {
    final now1 = DateTime.now();
    final recipe1 = Recipe(
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
      createdAt: now1,
      updatedAt: now1,
    );
    await create(recipe1);

    final now2 = DateTime.now();
    final recipe2 = Recipe(
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
      createdAt: now2,
      updatedAt: now2,
    );
    await create(recipe2);

    final now3 = DateTime.now();
    final recipe3 = Recipe(
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
      createdAt: now3,
      updatedAt: now3,
    );
    await create(recipe3);
  }
}
