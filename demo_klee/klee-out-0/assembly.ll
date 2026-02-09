; ModuleID = 'uaf_demo.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.database = type { %struct.link_t, %struct.link_t }
%struct.link_t = type { %struct.link_t*, %struct.link_t* }
%struct.book = type { i8*, i8*, %struct.link_t, %struct.link_t, %struct.author* }
%struct.author = type { i8*, i8*, i8*, %struct.link_t, %struct.link_t, %struct.link_t }
%struct.review = type { %struct.book*, %struct.author*, %struct.link_t, i32 }

@.str = private unnamed_addr constant [8 x i8] c"au_name\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"bk_name\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"au_publ\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"au_desc\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"bk_desc\00", align 1
@stdin = dso_local global i8* null, align 8, !dbg !0
@.str.5 = private unnamed_addr constant [33 x i8] c"dell->backward != (link_t *)NULL\00", align 1
@.str.1.6 = private unnamed_addr constant [15 x i8] c"../bookshelf.c\00", align 1
@__PRETTY_FUNCTION__.link_unlink = private unnamed_addr constant [27 x i8] c"void link_unlink(link_t *)\00", align 1
@db = dso_local global %struct.database zeroinitializer, align 8, !dbg !10
@.str.2.11 = private unnamed_addr constant [23 x i8] c"auth != (author *)NULL\00", align 1
@__PRETTY_FUNCTION__.create_review = private unnamed_addr constant [37 x i8] c"EDIT_CODE create_review(char *, int)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !121 {
  %1 = alloca i32, align 4
  %2 = alloca [128 x i8], align 16
  %3 = alloca [128 x i8], align 16
  %4 = alloca [128 x i8], align 16
  %5 = alloca [1024 x i8], align 16
  %6 = alloca [1024 x i8], align 16
  %7 = alloca %struct.book*, align 8
  %8 = alloca %struct.author*, align 8
  store i32 0, i32* %1, align 4
  %9 = call i32 (%struct.link_t*, ...) bitcast (void (%struct.link_t*)* @link_init to i32 (%struct.link_t*, ...)*)(%struct.link_t* noundef getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 0)), !dbg !125
  %10 = call i32 (%struct.link_t*, ...) bitcast (void (%struct.link_t*)* @link_init to i32 (%struct.link_t*, ...)*)(%struct.link_t* noundef getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 1)), !dbg !126
  call void @llvm.dbg.declare(metadata [128 x i8]* %2, metadata !127, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [128 x i8]* %3, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [128 x i8]* %4, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [1024 x i8]* %5, metadata !136, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [1024 x i8]* %6, metadata !141, metadata !DIExpression()), !dbg !142
  %11 = getelementptr inbounds [128 x i8], [128 x i8]* %2, i64 0, i64 0, !dbg !143
  call void @klee_make_symbolic(i8* noundef %11, i64 noundef 128, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !144
  %12 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 0, !dbg !145
  call void @klee_make_symbolic(i8* noundef %12, i64 noundef 128, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !146
  %13 = getelementptr inbounds [128 x i8], [128 x i8]* %4, i64 0, i64 0, !dbg !147
  call void @klee_make_symbolic(i8* noundef %13, i64 noundef 128, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)), !dbg !148
  %14 = getelementptr inbounds [1024 x i8], [1024 x i8]* %5, i64 0, i64 0, !dbg !149
  call void @klee_make_symbolic(i8* noundef %14, i64 noundef 1024, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0)), !dbg !150
  %15 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 0, !dbg !151
  call void @klee_make_symbolic(i8* noundef %15, i64 noundef 1024, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0)), !dbg !152
  %16 = getelementptr inbounds [128 x i8], [128 x i8]* %2, i64 0, i64 127, !dbg !153
  store i8 0, i8* %16, align 1, !dbg !154
  %17 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 127, !dbg !155
  store i8 0, i8* %17, align 1, !dbg !156
  %18 = getelementptr inbounds [128 x i8], [128 x i8]* %4, i64 0, i64 127, !dbg !157
  store i8 0, i8* %18, align 1, !dbg !158
  %19 = getelementptr inbounds [1024 x i8], [1024 x i8]* %5, i64 0, i64 1023, !dbg !159
  store i8 0, i8* %19, align 1, !dbg !160
  %20 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 1023, !dbg !161
  store i8 0, i8* %20, align 1, !dbg !162
  %21 = getelementptr inbounds [128 x i8], [128 x i8]* %2, i64 0, i64 0, !dbg !163
  %22 = getelementptr inbounds [128 x i8], [128 x i8]* %4, i64 0, i64 0, !dbg !164
  %23 = getelementptr inbounds [1024 x i8], [1024 x i8]* %5, i64 0, i64 0, !dbg !165
  %24 = call i32 @create_author(i8* noundef %21, i32 noundef 128, i8* noundef %22, i32 noundef 128, i8* noundef %23, i32 noundef 1024), !dbg !166
  %25 = getelementptr inbounds [128 x i8], [128 x i8]* %2, i64 0, i64 0, !dbg !167
  %26 = getelementptr inbounds [128 x i8], [128 x i8]* %3, i64 0, i64 0, !dbg !168
  %27 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 0, !dbg !169
  %28 = call i32 @create_book(i8* noundef %25, i8* noundef %26, i32 noundef 128, i8* noundef %27, i32 noundef 1024), !dbg !170
  call void @llvm.dbg.declare(metadata %struct.book** %7, metadata !171, metadata !DIExpression()), !dbg !172
  store %struct.book* null, %struct.book** %7, align 8, !dbg !172
  %29 = load %struct.link_t*, %struct.link_t** getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 1, i32 1), align 8, !dbg !173
  %30 = icmp ne %struct.link_t* %29, null, !dbg !175
  br i1 %30, label %31, label %36, !dbg !176

31:                                               ; preds = %0
  %32 = load %struct.link_t*, %struct.link_t** getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 1, i32 1), align 8, !dbg !177
  %33 = bitcast %struct.link_t* %32 to i8*, !dbg !177
  %34 = getelementptr inbounds i8, i8* %33, i64 -16, !dbg !177
  %35 = bitcast i8* %34 to %struct.book*, !dbg !177
  store %struct.book* %35, %struct.book** %7, align 8, !dbg !179
  br label %36, !dbg !180

36:                                               ; preds = %31, %0
  call void @llvm.dbg.declare(metadata %struct.author** %8, metadata !181, metadata !DIExpression()), !dbg !182
  store %struct.author* null, %struct.author** %8, align 8, !dbg !182
  %37 = load %struct.book*, %struct.book** %7, align 8, !dbg !183
  %38 = icmp ne %struct.book* %37, null, !dbg !185
  br i1 %38, label %39, label %43, !dbg !186

39:                                               ; preds = %36
  %40 = load %struct.book*, %struct.book** %7, align 8, !dbg !187
  %41 = getelementptr inbounds %struct.book, %struct.book* %40, i32 0, i32 4, !dbg !189
  %42 = load %struct.author*, %struct.author** %41, align 8, !dbg !189
  store %struct.author* %42, %struct.author** %8, align 8, !dbg !190
  br label %43, !dbg !191

43:                                               ; preds = %39, %36
  %44 = getelementptr inbounds [128 x i8], [128 x i8]* %2, i64 0, i64 0, !dbg !192
  %45 = call i32 @delete_author(i8* noundef %44), !dbg !193
  %46 = load %struct.book*, %struct.book** %7, align 8, !dbg !194
  %47 = icmp ne %struct.book* %46, null, !dbg !194
  br i1 %47, label %48, label %51, !dbg !196

48:                                               ; preds = %43
  %49 = load %struct.book*, %struct.book** %7, align 8, !dbg !197
  %50 = bitcast %struct.book* %49 to i8*, !dbg !197
  call void @klee_check_memory_access(i8* noundef %50, i64 noundef 72), !dbg !199
  br label %51, !dbg !200

51:                                               ; preds = %48, %43
  ret i32 0, !dbg !201
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) #2

declare void @klee_check_memory_access(i8* noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @printf(i8* noundef %0, ...) #0 !dbg !202 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !207, metadata !DIExpression()), !dbg !208
  %3 = load i8*, i8** %2, align 8, !dbg !209
  ret i32 0, !dbg !210
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @puts(i8* noundef %0) #0 !dbg !211 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !214, metadata !DIExpression()), !dbg !215
  %3 = load i8*, i8** %2, align 8, !dbg !216
  ret i32 0, !dbg !217
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @putchar(i32 noundef %0) #0 !dbg !218 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !221, metadata !DIExpression()), !dbg !222
  %3 = load i32, i32* %2, align 4, !dbg !223
  %4 = load i32, i32* %2, align 4, !dbg !224
  ret i32 %4, !dbg !225
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getchar() #0 !dbg !226 {
  ret i32 -1, !dbg !227
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @fgets(i8* noundef %0, i32 noundef %1, i8* noundef %2) #0 !dbg !228 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !233, metadata !DIExpression()), !dbg !234
  store i8* %2, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !235, metadata !DIExpression()), !dbg !236
  %7 = load i8*, i8** %4, align 8, !dbg !237
  %8 = load i32, i32* %5, align 4, !dbg !238
  %9 = load i8*, i8** %6, align 8, !dbg !239
  ret i8* null, !dbg !240
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @__isoc99_scanf(i8* noundef %0, ...) #0 !dbg !241 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !242, metadata !DIExpression()), !dbg !243
  %3 = load i8*, i8** %2, align 8, !dbg !244
  ret i32 0, !dbg !245
}

; Function Attrs: noinline nounwind optnone readonly uwtable willreturn
define dso_local i64 @strlen(i8* noundef nonnull %0) #3 !dbg !246 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !250, metadata !DIExpression()), !dbg !251
  %5 = load i8*, i8** %3, align 8, !dbg !252
  %6 = icmp ne i8* %5, null, !dbg !252
  br i1 %6, label %8, label %7, !dbg !254

7:                                                ; preds = %1
  store i64 0, i64* %2, align 8, !dbg !255
  br label %20, !dbg !255

8:                                                ; preds = %1
  call void @llvm.dbg.declare(metadata i64* %4, metadata !256, metadata !DIExpression()), !dbg !259
  store i64 0, i64* %4, align 8, !dbg !259
  br label %9, !dbg !260

9:                                                ; preds = %15, %8
  %10 = load i8*, i8** %3, align 8, !dbg !261
  %11 = load i64, i64* %4, align 8, !dbg !262
  %12 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !261
  %13 = load i8, i8* %12, align 1, !dbg !261
  %14 = icmp ne i8 %13, 0, !dbg !260
  br i1 %14, label %15, label %18, !dbg !260

15:                                               ; preds = %9
  %16 = load i64, i64* %4, align 8, !dbg !263
  %17 = add i64 %16, 1, !dbg !263
  store i64 %17, i64* %4, align 8, !dbg !263
  br label %9, !dbg !260, !llvm.loop !264

18:                                               ; preds = %9
  %19 = load i64, i64* %4, align 8, !dbg !266
  store i64 %19, i64* %2, align 8, !dbg !267
  br label %20, !dbg !267

20:                                               ; preds = %18, %7
  %21 = load i64, i64* %2, align 8, !dbg !268
  ret i64 %21, !dbg !268
}

; Function Attrs: noinline nounwind optnone readonly uwtable willreturn
define dso_local i64 @strnlen(i8* noundef nonnull %0, i64 noundef %1) #3 !dbg !269 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !272, metadata !DIExpression()), !dbg !273
  store i64 %1, i64* %5, align 8
  call void @llvm.dbg.declare(metadata i64* %5, metadata !274, metadata !DIExpression()), !dbg !275
  %7 = load i8*, i8** %4, align 8, !dbg !276
  %8 = icmp ne i8* %7, null, !dbg !276
  br i1 %8, label %10, label %9, !dbg !278

9:                                                ; preds = %2
  store i64 0, i64* %3, align 8, !dbg !279
  br label %30, !dbg !279

10:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata i64* %6, metadata !280, metadata !DIExpression()), !dbg !281
  store i64 0, i64* %6, align 8, !dbg !281
  br label %11, !dbg !282

11:                                               ; preds = %25, %10
  %12 = load i64, i64* %6, align 8, !dbg !283
  %13 = load i64, i64* %5, align 8, !dbg !286
  %14 = icmp ult i64 %12, %13, !dbg !287
  br i1 %14, label %15, label %22, !dbg !288

15:                                               ; preds = %11
  %16 = load i8*, i8** %4, align 8, !dbg !289
  %17 = load i64, i64* %6, align 8, !dbg !290
  %18 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !289
  %19 = load i8, i8* %18, align 1, !dbg !289
  %20 = sext i8 %19 to i32, !dbg !289
  %21 = icmp ne i32 %20, 0, !dbg !288
  br label %22

22:                                               ; preds = %15, %11
  %23 = phi i1 [ false, %11 ], [ %21, %15 ], !dbg !291
  br i1 %23, label %24, label %28, !dbg !292

24:                                               ; preds = %22
  br label %25, !dbg !293

25:                                               ; preds = %24
  %26 = load i64, i64* %6, align 8, !dbg !295
  %27 = add i64 %26, 1, !dbg !295
  store i64 %27, i64* %6, align 8, !dbg !295
  br label %11, !dbg !296, !llvm.loop !297

28:                                               ; preds = %22
  %29 = load i64, i64* %6, align 8, !dbg !299
  store i64 %29, i64* %3, align 8, !dbg !300
  br label %30, !dbg !300

30:                                               ; preds = %28, %9
  %31 = load i64, i64* %3, align 8, !dbg !301
  ret i64 %31, !dbg !301
}

; Function Attrs: noinline nounwind optnone readonly uwtable willreturn
define dso_local i64 @strcspn(i8* noundef nonnull %0, i8* noundef nonnull %1) #3 !dbg !302 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !305, metadata !DIExpression()), !dbg !306
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !307, metadata !DIExpression()), !dbg !308
  %8 = load i8*, i8** %4, align 8, !dbg !309
  %9 = icmp ne i8* %8, null, !dbg !309
  br i1 %9, label %10, label %13, !dbg !311

10:                                               ; preds = %2
  %11 = load i8*, i8** %5, align 8, !dbg !312
  %12 = icmp ne i8* %11, null, !dbg !312
  br i1 %12, label %14, label %13, !dbg !313

13:                                               ; preds = %10, %2
  store i64 0, i64* %3, align 8, !dbg !314
  br label %53, !dbg !314

14:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata i64* %6, metadata !315, metadata !DIExpression()), !dbg !317
  store i64 0, i64* %6, align 8, !dbg !317
  br label %15, !dbg !318

15:                                               ; preds = %47, %14
  %16 = load i8*, i8** %4, align 8, !dbg !319
  %17 = load i64, i64* %6, align 8, !dbg !321
  %18 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !319
  %19 = load i8, i8* %18, align 1, !dbg !319
  %20 = icmp ne i8 %19, 0, !dbg !322
  br i1 %20, label %21, label %50, !dbg !322

21:                                               ; preds = %15
  call void @llvm.dbg.declare(metadata i64* %7, metadata !323, metadata !DIExpression()), !dbg !326
  store i64 0, i64* %7, align 8, !dbg !326
  br label %22, !dbg !327

22:                                               ; preds = %43, %21
  %23 = load i8*, i8** %5, align 8, !dbg !328
  %24 = load i64, i64* %7, align 8, !dbg !330
  %25 = getelementptr inbounds i8, i8* %23, i64 %24, !dbg !328
  %26 = load i8, i8* %25, align 1, !dbg !328
  %27 = icmp ne i8 %26, 0, !dbg !331
  br i1 %27, label %28, label %46, !dbg !331

28:                                               ; preds = %22
  %29 = load i8*, i8** %4, align 8, !dbg !332
  %30 = load i64, i64* %6, align 8, !dbg !335
  %31 = getelementptr inbounds i8, i8* %29, i64 %30, !dbg !332
  %32 = load i8, i8* %31, align 1, !dbg !332
  %33 = sext i8 %32 to i32, !dbg !332
  %34 = load i8*, i8** %5, align 8, !dbg !336
  %35 = load i64, i64* %7, align 8, !dbg !337
  %36 = getelementptr inbounds i8, i8* %34, i64 %35, !dbg !336
  %37 = load i8, i8* %36, align 1, !dbg !336
  %38 = sext i8 %37 to i32, !dbg !336
  %39 = icmp eq i32 %33, %38, !dbg !338
  br i1 %39, label %40, label %42, !dbg !339

40:                                               ; preds = %28
  %41 = load i64, i64* %6, align 8, !dbg !340
  store i64 %41, i64* %3, align 8, !dbg !341
  br label %53, !dbg !341

42:                                               ; preds = %28
  br label %43, !dbg !342

43:                                               ; preds = %42
  %44 = load i64, i64* %7, align 8, !dbg !343
  %45 = add i64 %44, 1, !dbg !343
  store i64 %45, i64* %7, align 8, !dbg !343
  br label %22, !dbg !344, !llvm.loop !345

46:                                               ; preds = %22
  br label %47, !dbg !347

47:                                               ; preds = %46
  %48 = load i64, i64* %6, align 8, !dbg !348
  %49 = add i64 %48, 1, !dbg !348
  store i64 %49, i64* %6, align 8, !dbg !348
  br label %15, !dbg !349, !llvm.loop !350

50:                                               ; preds = %15
  %51 = load i8*, i8** %4, align 8, !dbg !352
  %52 = call i64 @strlen(i8* noundef %51) #10, !dbg !353
  store i64 %52, i64* %3, align 8, !dbg !354
  br label %53, !dbg !354

53:                                               ; preds = %50, %40, %13
  %54 = load i64, i64* %3, align 8, !dbg !355
  ret i64 %54, !dbg !355
}

; Function Attrs: noinline nounwind optnone readonly uwtable willreturn
define dso_local i32 @strcmp(i8* noundef nonnull %0, i8* noundef nonnull %1) #3 !dbg !356 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !359, metadata !DIExpression()), !dbg !360
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !361, metadata !DIExpression()), !dbg !362
  %6 = load i8*, i8** %4, align 8, !dbg !363
  %7 = load i8*, i8** %5, align 8, !dbg !365
  %8 = icmp eq i8* %6, %7, !dbg !366
  br i1 %8, label %9, label %10, !dbg !367

9:                                                ; preds = %2
  store i32 0, i32* %3, align 4, !dbg !368
  br label %47, !dbg !368

10:                                               ; preds = %2
  %11 = load i8*, i8** %4, align 8, !dbg !369
  %12 = icmp ne i8* %11, null, !dbg !369
  br i1 %12, label %14, label %13, !dbg !371

13:                                               ; preds = %10
  store i32 -1, i32* %3, align 4, !dbg !372
  br label %47, !dbg !372

14:                                               ; preds = %10
  %15 = load i8*, i8** %5, align 8, !dbg !373
  %16 = icmp ne i8* %15, null, !dbg !373
  br i1 %16, label %18, label %17, !dbg !375

17:                                               ; preds = %14
  store i32 1, i32* %3, align 4, !dbg !376
  br label %47, !dbg !376

18:                                               ; preds = %14
  br label %19, !dbg !377

19:                                               ; preds = %34, %18
  %20 = load i8*, i8** %4, align 8, !dbg !378
  %21 = load i8, i8* %20, align 1, !dbg !379
  %22 = sext i8 %21 to i32, !dbg !379
  %23 = icmp ne i32 %22, 0, !dbg !379
  br i1 %23, label %24, label %32, !dbg !380

24:                                               ; preds = %19
  %25 = load i8*, i8** %4, align 8, !dbg !381
  %26 = load i8, i8* %25, align 1, !dbg !382
  %27 = sext i8 %26 to i32, !dbg !382
  %28 = load i8*, i8** %5, align 8, !dbg !383
  %29 = load i8, i8* %28, align 1, !dbg !384
  %30 = sext i8 %29 to i32, !dbg !384
  %31 = icmp eq i32 %27, %30, !dbg !385
  br label %32

32:                                               ; preds = %24, %19
  %33 = phi i1 [ false, %19 ], [ %31, %24 ], !dbg !386
  br i1 %33, label %34, label %39, !dbg !377

34:                                               ; preds = %32
  %35 = load i8*, i8** %4, align 8, !dbg !387
  %36 = getelementptr inbounds i8, i8* %35, i32 1, !dbg !387
  store i8* %36, i8** %4, align 8, !dbg !387
  %37 = load i8*, i8** %5, align 8, !dbg !389
  %38 = getelementptr inbounds i8, i8* %37, i32 1, !dbg !389
  store i8* %38, i8** %5, align 8, !dbg !389
  br label %19, !dbg !377, !llvm.loop !390

39:                                               ; preds = %32
  %40 = load i8*, i8** %4, align 8, !dbg !392
  %41 = load i8, i8* %40, align 1, !dbg !393
  %42 = zext i8 %41 to i32, !dbg !394
  %43 = load i8*, i8** %5, align 8, !dbg !395
  %44 = load i8, i8* %43, align 1, !dbg !396
  %45 = zext i8 %44 to i32, !dbg !397
  %46 = sub nsw i32 %42, %45, !dbg !398
  store i32 %46, i32* %3, align 4, !dbg !399
  br label %47, !dbg !399

47:                                               ; preds = %39, %17, %13, %9
  %48 = load i32, i32* %3, align 4, !dbg !400
  ret i32 %48, !dbg !400
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @strncpy(i8* noundef nonnull %0, i8* noundef nonnull %1, i64 noundef %2) #0 !dbg !401 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !404, metadata !DIExpression()), !dbg !405
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !406, metadata !DIExpression()), !dbg !407
  store i64 %2, i64* %7, align 8
  call void @llvm.dbg.declare(metadata i64* %7, metadata !408, metadata !DIExpression()), !dbg !409
  %9 = load i8*, i8** %5, align 8, !dbg !410
  %10 = icmp ne i8* %9, null, !dbg !410
  br i1 %10, label %11, label %14, !dbg !412

11:                                               ; preds = %3
  %12 = load i8*, i8** %6, align 8, !dbg !413
  %13 = icmp ne i8* %12, null, !dbg !413
  br i1 %13, label %16, label %14, !dbg !414

14:                                               ; preds = %11, %3
  %15 = load i8*, i8** %5, align 8, !dbg !415
  store i8* %15, i8** %4, align 8, !dbg !416
  br label %55, !dbg !416

16:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata i64* %8, metadata !417, metadata !DIExpression()), !dbg !418
  store i64 0, i64* %8, align 8, !dbg !418
  br label %17, !dbg !419

17:                                               ; preds = %38, %16
  %18 = load i64, i64* %8, align 8, !dbg !420
  %19 = load i64, i64* %7, align 8, !dbg !423
  %20 = icmp ult i64 %18, %19, !dbg !424
  br i1 %20, label %21, label %28, !dbg !425

21:                                               ; preds = %17
  %22 = load i8*, i8** %6, align 8, !dbg !426
  %23 = load i64, i64* %8, align 8, !dbg !427
  %24 = getelementptr inbounds i8, i8* %22, i64 %23, !dbg !426
  %25 = load i8, i8* %24, align 1, !dbg !426
  %26 = sext i8 %25 to i32, !dbg !426
  %27 = icmp ne i32 %26, 0, !dbg !425
  br label %28

28:                                               ; preds = %21, %17
  %29 = phi i1 [ false, %17 ], [ %27, %21 ], !dbg !428
  br i1 %29, label %30, label %41, !dbg !429

30:                                               ; preds = %28
  %31 = load i8*, i8** %6, align 8, !dbg !430
  %32 = load i64, i64* %8, align 8, !dbg !431
  %33 = getelementptr inbounds i8, i8* %31, i64 %32, !dbg !430
  %34 = load i8, i8* %33, align 1, !dbg !430
  %35 = load i8*, i8** %5, align 8, !dbg !432
  %36 = load i64, i64* %8, align 8, !dbg !433
  %37 = getelementptr inbounds i8, i8* %35, i64 %36, !dbg !432
  store i8 %34, i8* %37, align 1, !dbg !434
  br label %38, !dbg !432

38:                                               ; preds = %30
  %39 = load i64, i64* %8, align 8, !dbg !435
  %40 = add i64 %39, 1, !dbg !435
  store i64 %40, i64* %8, align 8, !dbg !435
  br label %17, !dbg !436, !llvm.loop !437

41:                                               ; preds = %28
  br label %42, !dbg !439

42:                                               ; preds = %50, %41
  %43 = load i64, i64* %8, align 8, !dbg !440
  %44 = load i64, i64* %7, align 8, !dbg !443
  %45 = icmp ult i64 %43, %44, !dbg !444
  br i1 %45, label %46, label %53, !dbg !445

46:                                               ; preds = %42
  %47 = load i8*, i8** %5, align 8, !dbg !446
  %48 = load i64, i64* %8, align 8, !dbg !447
  %49 = getelementptr inbounds i8, i8* %47, i64 %48, !dbg !446
  store i8 0, i8* %49, align 1, !dbg !448
  br label %50, !dbg !446

50:                                               ; preds = %46
  %51 = load i64, i64* %8, align 8, !dbg !449
  %52 = add i64 %51, 1, !dbg !449
  store i64 %52, i64* %8, align 8, !dbg !449
  br label %42, !dbg !450, !llvm.loop !451

53:                                               ; preds = %42
  %54 = load i8*, i8** %5, align 8, !dbg !453
  store i8* %54, i8** %4, align 8, !dbg !454
  br label %55, !dbg !454

55:                                               ; preds = %53, %14
  %56 = load i8*, i8** %4, align 8, !dbg !455
  ret i8* %56, !dbg !455
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local noalias i8* @strdup(i8* noundef nonnull %0) #0 !dbg !456 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !459, metadata !DIExpression()), !dbg !460
  %7 = load i8*, i8** %3, align 8, !dbg !461
  %8 = icmp ne i8* %7, null, !dbg !461
  br i1 %8, label %10, label %9, !dbg !463

9:                                                ; preds = %1
  store i8* null, i8** %2, align 8, !dbg !464
  br label %37, !dbg !464

10:                                               ; preds = %1
  call void @llvm.dbg.declare(metadata i64* %4, metadata !465, metadata !DIExpression()), !dbg !466
  %11 = load i8*, i8** %3, align 8, !dbg !467
  %12 = call i64 @strlen(i8* noundef %11) #10, !dbg !468
  %13 = add i64 %12, 1, !dbg !469
  store i64 %13, i64* %4, align 8, !dbg !466
  call void @llvm.dbg.declare(metadata i8** %5, metadata !470, metadata !DIExpression()), !dbg !471
  %14 = load i64, i64* %4, align 8, !dbg !472
  %15 = call noalias i8* @malloc(i64 noundef %14) #11, !dbg !473
  store i8* %15, i8** %5, align 8, !dbg !471
  %16 = load i8*, i8** %5, align 8, !dbg !474
  %17 = icmp ne i8* %16, null, !dbg !474
  br i1 %17, label %19, label %18, !dbg !476

18:                                               ; preds = %10
  store i8* null, i8** %2, align 8, !dbg !477
  br label %37, !dbg !477

19:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata i64* %6, metadata !478, metadata !DIExpression()), !dbg !480
  store i64 0, i64* %6, align 8, !dbg !480
  br label %20, !dbg !481

20:                                               ; preds = %32, %19
  %21 = load i64, i64* %6, align 8, !dbg !482
  %22 = load i64, i64* %4, align 8, !dbg !484
  %23 = icmp ult i64 %21, %22, !dbg !485
  br i1 %23, label %24, label %35, !dbg !486

24:                                               ; preds = %20
  %25 = load i8*, i8** %3, align 8, !dbg !487
  %26 = load i64, i64* %6, align 8, !dbg !488
  %27 = getelementptr inbounds i8, i8* %25, i64 %26, !dbg !487
  %28 = load i8, i8* %27, align 1, !dbg !487
  %29 = load i8*, i8** %5, align 8, !dbg !489
  %30 = load i64, i64* %6, align 8, !dbg !490
  %31 = getelementptr inbounds i8, i8* %29, i64 %30, !dbg !489
  store i8 %28, i8* %31, align 1, !dbg !491
  br label %32, !dbg !489

32:                                               ; preds = %24
  %33 = load i64, i64* %6, align 8, !dbg !492
  %34 = add i64 %33, 1, !dbg !492
  store i64 %34, i64* %6, align 8, !dbg !492
  br label %20, !dbg !493, !llvm.loop !494

35:                                               ; preds = %20
  %36 = load i8*, i8** %5, align 8, !dbg !496
  store i8* %36, i8** %2, align 8, !dbg !497
  br label %37, !dbg !497

37:                                               ; preds = %35, %18, %9
  %38 = load i8*, i8** %2, align 8, !dbg !498
  ret i8* %38, !dbg !498
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @strtol(i8* noundef nonnull %0, i8** noundef %1, i32 noundef %2) #0 !dbg !499 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !504, metadata !DIExpression()), !dbg !505
  store i8** %1, i8*** %6, align 8
  call void @llvm.dbg.declare(metadata i8*** %6, metadata !506, metadata !DIExpression()), !dbg !507
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !508, metadata !DIExpression()), !dbg !509
  %10 = load i32, i32* %7, align 4, !dbg !510
  %11 = load i8*, i8** %5, align 8, !dbg !511
  %12 = icmp ne i8* %11, null, !dbg !511
  br i1 %12, label %20, label %13, !dbg !513

13:                                               ; preds = %3
  %14 = load i8**, i8*** %6, align 8, !dbg !514
  %15 = icmp ne i8** %14, null, !dbg !514
  br i1 %15, label %16, label %19, !dbg !517

16:                                               ; preds = %13
  %17 = load i8*, i8** %5, align 8, !dbg !518
  %18 = load i8**, i8*** %6, align 8, !dbg !519
  store i8* %17, i8** %18, align 8, !dbg !520
  br label %19, !dbg !521

19:                                               ; preds = %16, %13
  store i64 0, i64* %4, align 8, !dbg !522
  br label %53, !dbg !522

20:                                               ; preds = %3
  call void @llvm.dbg.declare(metadata i64* %8, metadata !523, metadata !DIExpression()), !dbg !524
  store i64 0, i64* %8, align 8, !dbg !524
  call void @llvm.dbg.declare(metadata i8** %9, metadata !525, metadata !DIExpression()), !dbg !526
  %21 = load i8*, i8** %5, align 8, !dbg !527
  store i8* %21, i8** %9, align 8, !dbg !526
  br label %22, !dbg !528

22:                                               ; preds = %34, %20
  %23 = load i8*, i8** %9, align 8, !dbg !529
  %24 = load i8, i8* %23, align 1, !dbg !530
  %25 = sext i8 %24 to i32, !dbg !530
  %26 = icmp sge i32 %25, 48, !dbg !531
  br i1 %26, label %27, label %32, !dbg !532

27:                                               ; preds = %22
  %28 = load i8*, i8** %9, align 8, !dbg !533
  %29 = load i8, i8* %28, align 1, !dbg !534
  %30 = sext i8 %29 to i32, !dbg !534
  %31 = icmp sle i32 %30, 57, !dbg !535
  br label %32

32:                                               ; preds = %27, %22
  %33 = phi i1 [ false, %22 ], [ %31, %27 ], !dbg !536
  br i1 %33, label %34, label %45, !dbg !528

34:                                               ; preds = %32
  %35 = load i64, i64* %8, align 8, !dbg !537
  %36 = mul nsw i64 %35, 10, !dbg !539
  %37 = load i8*, i8** %9, align 8, !dbg !540
  %38 = load i8, i8* %37, align 1, !dbg !541
  %39 = sext i8 %38 to i32, !dbg !541
  %40 = sub nsw i32 %39, 48, !dbg !542
  %41 = sext i32 %40 to i64, !dbg !543
  %42 = add nsw i64 %36, %41, !dbg !544
  store i64 %42, i64* %8, align 8, !dbg !545
  %43 = load i8*, i8** %9, align 8, !dbg !546
  %44 = getelementptr inbounds i8, i8* %43, i32 1, !dbg !546
  store i8* %44, i8** %9, align 8, !dbg !546
  br label %22, !dbg !528, !llvm.loop !547

45:                                               ; preds = %32
  %46 = load i8**, i8*** %6, align 8, !dbg !549
  %47 = icmp ne i8** %46, null, !dbg !549
  br i1 %47, label %48, label %51, !dbg !551

48:                                               ; preds = %45
  %49 = load i8*, i8** %9, align 8, !dbg !552
  %50 = load i8**, i8*** %6, align 8, !dbg !553
  store i8* %49, i8** %50, align 8, !dbg !554
  br label %51, !dbg !555

51:                                               ; preds = %48, %45
  %52 = load i64, i64* %8, align 8, !dbg !556
  store i64 %52, i64* %4, align 8, !dbg !557
  br label %53, !dbg !557

53:                                               ; preds = %51, %19
  %54 = load i64, i64* %4, align 8, !dbg !558
  ret i64 %54, !dbg !558
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @sin(double noundef %0) #0 !dbg !559 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !563, metadata !DIExpression()), !dbg !564
  %3 = load double, double* %2, align 8, !dbg !565
  ret double 0.000000e+00, !dbg !566
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @cos(double noundef %0) #0 !dbg !567 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !568, metadata !DIExpression()), !dbg !569
  %3 = load double, double* %2, align 8, !dbg !570
  ret double 0.000000e+00, !dbg !571
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @llround(double noundef %0) #0 !dbg !572 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  call void @llvm.dbg.declare(metadata double* %2, metadata !576, metadata !DIExpression()), !dbg !577
  %3 = load double, double* %2, align 8, !dbg !578
  ret i64 0, !dbg !579
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_card() #0 !dbg !580 {
  ret void, !dbg !583
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define dso_local void @exit(i32 noundef %0) #5 !dbg !584 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !587, metadata !DIExpression()), !dbg !588
  %3 = load i32, i32* %2, align 4, !dbg !589
  call void @abort() #12, !dbg !590
  unreachable, !dbg !590
}

; Function Attrs: noreturn nounwind
declare void @abort() #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @alloc_struct(i64 noundef %0) #0 !dbg !591 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !594, metadata !DIExpression()), !dbg !595
  call void @llvm.dbg.declare(metadata i8** %4, metadata !596, metadata !DIExpression()), !dbg !597
  %5 = load i64, i64* %3, align 8, !dbg !598
  %6 = call noalias i8* @malloc(i64 noundef %5) #11, !dbg !599
  store i8* %6, i8** %4, align 8, !dbg !597
  %7 = load i8*, i8** %4, align 8, !dbg !600
  %8 = icmp ne i8* %7, null, !dbg !600
  br i1 %8, label %10, label %9, !dbg !602

9:                                                ; preds = %1
  store i8* null, i8** %2, align 8, !dbg !603
  br label %15, !dbg !603

10:                                               ; preds = %1
  %11 = load i8*, i8** %4, align 8, !dbg !604
  %12 = load i64, i64* %3, align 8, !dbg !605
  %13 = call i8* @memset(i8* %11, i32 0, i64 %12), !dbg !606
  %14 = load i8*, i8** %4, align 8, !dbg !607
  store i8* %14, i8** %2, align 8, !dbg !608
  br label %15, !dbg !608

15:                                               ; preds = %10, %9
  %16 = load i8*, i8** %2, align 8, !dbg !609
  ret i8* %16, !dbg !609
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @link_init(%struct.link_t* noundef %0) #0 !dbg !610 {
  %2 = alloca %struct.link_t*, align 8
  store %struct.link_t* %0, %struct.link_t** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %2, metadata !613, metadata !DIExpression()), !dbg !614
  %3 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !615
  %4 = getelementptr inbounds %struct.link_t, %struct.link_t* %3, i32 0, i32 0, !dbg !616
  store %struct.link_t* null, %struct.link_t** %4, align 8, !dbg !617
  %5 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !618
  %6 = getelementptr inbounds %struct.link_t, %struct.link_t* %5, i32 0, i32 1, !dbg !619
  store %struct.link_t* null, %struct.link_t** %6, align 8, !dbg !620
  ret void, !dbg !621
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @link_prepend(%struct.link_t* noundef %0, %struct.link_t* noundef %1) #0 !dbg !622 {
  %3 = alloca %struct.link_t*, align 8
  %4 = alloca %struct.link_t*, align 8
  store %struct.link_t* %0, %struct.link_t** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %3, metadata !625, metadata !DIExpression()), !dbg !626
  store %struct.link_t* %1, %struct.link_t** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %4, metadata !627, metadata !DIExpression()), !dbg !628
  %5 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !629
  %6 = load %struct.link_t*, %struct.link_t** %4, align 8, !dbg !630
  %7 = getelementptr inbounds %struct.link_t, %struct.link_t* %6, i32 0, i32 0, !dbg !631
  store %struct.link_t* %5, %struct.link_t** %7, align 8, !dbg !632
  %8 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !633
  %9 = getelementptr inbounds %struct.link_t, %struct.link_t* %8, i32 0, i32 1, !dbg !635
  %10 = load %struct.link_t*, %struct.link_t** %9, align 8, !dbg !635
  %11 = icmp eq %struct.link_t* %10, null, !dbg !636
  br i1 %11, label %12, label %15, !dbg !637

12:                                               ; preds = %2
  %13 = load %struct.link_t*, %struct.link_t** %4, align 8, !dbg !638
  %14 = getelementptr inbounds %struct.link_t, %struct.link_t* %13, i32 0, i32 1, !dbg !640
  store %struct.link_t* null, %struct.link_t** %14, align 8, !dbg !641
  br label %26, !dbg !642

15:                                               ; preds = %2
  %16 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !643
  %17 = getelementptr inbounds %struct.link_t, %struct.link_t* %16, i32 0, i32 1, !dbg !645
  %18 = load %struct.link_t*, %struct.link_t** %17, align 8, !dbg !645
  %19 = load %struct.link_t*, %struct.link_t** %4, align 8, !dbg !646
  %20 = getelementptr inbounds %struct.link_t, %struct.link_t* %19, i32 0, i32 1, !dbg !647
  store %struct.link_t* %18, %struct.link_t** %20, align 8, !dbg !648
  %21 = load %struct.link_t*, %struct.link_t** %4, align 8, !dbg !649
  %22 = load %struct.link_t*, %struct.link_t** %4, align 8, !dbg !650
  %23 = getelementptr inbounds %struct.link_t, %struct.link_t* %22, i32 0, i32 1, !dbg !651
  %24 = load %struct.link_t*, %struct.link_t** %23, align 8, !dbg !651
  %25 = getelementptr inbounds %struct.link_t, %struct.link_t* %24, i32 0, i32 0, !dbg !652
  store %struct.link_t* %21, %struct.link_t** %25, align 8, !dbg !653
  br label %26

26:                                               ; preds = %15, %12
  %27 = load %struct.link_t*, %struct.link_t** %4, align 8, !dbg !654
  %28 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !655
  %29 = getelementptr inbounds %struct.link_t, %struct.link_t* %28, i32 0, i32 1, !dbg !656
  store %struct.link_t* %27, %struct.link_t** %29, align 8, !dbg !657
  ret void, !dbg !658
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @link_unlink(%struct.link_t* noundef %0) #0 !dbg !659 {
  %2 = alloca %struct.link_t*, align 8
  store %struct.link_t* %0, %struct.link_t** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %2, metadata !660, metadata !DIExpression()), !dbg !661
  %3 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !662
  %4 = getelementptr inbounds %struct.link_t, %struct.link_t* %3, i32 0, i32 0, !dbg !662
  %5 = load %struct.link_t*, %struct.link_t** %4, align 8, !dbg !662
  %6 = icmp ne %struct.link_t* %5, null, !dbg !662
  br i1 %6, label %7, label %8, !dbg !665

7:                                                ; preds = %1
  br label %9, !dbg !665

8:                                                ; preds = %1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.6, i64 0, i64 0), i32 noundef 32, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @__PRETTY_FUNCTION__.link_unlink, i64 0, i64 0)) #12, !dbg !662
  unreachable, !dbg !662

9:                                                ; preds = %7
  %10 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !666
  %11 = getelementptr inbounds %struct.link_t, %struct.link_t* %10, i32 0, i32 1, !dbg !667
  %12 = load %struct.link_t*, %struct.link_t** %11, align 8, !dbg !667
  %13 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !668
  %14 = getelementptr inbounds %struct.link_t, %struct.link_t* %13, i32 0, i32 0, !dbg !669
  %15 = load %struct.link_t*, %struct.link_t** %14, align 8, !dbg !669
  %16 = getelementptr inbounds %struct.link_t, %struct.link_t* %15, i32 0, i32 1, !dbg !670
  store %struct.link_t* %12, %struct.link_t** %16, align 8, !dbg !671
  %17 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !672
  %18 = getelementptr inbounds %struct.link_t, %struct.link_t* %17, i32 0, i32 1, !dbg !674
  %19 = load %struct.link_t*, %struct.link_t** %18, align 8, !dbg !674
  %20 = icmp ne %struct.link_t* %19, null, !dbg !675
  br i1 %20, label %21, label %29, !dbg !676

21:                                               ; preds = %9
  %22 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !677
  %23 = getelementptr inbounds %struct.link_t, %struct.link_t* %22, i32 0, i32 0, !dbg !679
  %24 = load %struct.link_t*, %struct.link_t** %23, align 8, !dbg !679
  %25 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !680
  %26 = getelementptr inbounds %struct.link_t, %struct.link_t* %25, i32 0, i32 1, !dbg !681
  %27 = load %struct.link_t*, %struct.link_t** %26, align 8, !dbg !681
  %28 = getelementptr inbounds %struct.link_t, %struct.link_t* %27, i32 0, i32 0, !dbg !682
  store %struct.link_t* %24, %struct.link_t** %28, align 8, !dbg !683
  br label %29, !dbg !684

29:                                               ; preds = %21, %9
  %30 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !685
  %31 = getelementptr inbounds %struct.link_t, %struct.link_t* %30, i32 0, i32 0, !dbg !686
  store %struct.link_t* null, %struct.link_t** %31, align 8, !dbg !687
  %32 = load %struct.link_t*, %struct.link_t** %2, align 8, !dbg !688
  %33 = getelementptr inbounds %struct.link_t, %struct.link_t* %32, i32 0, i32 1, !dbg !689
  store %struct.link_t* null, %struct.link_t** %33, align 8, !dbg !690
  ret void, !dbg !691
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.book* @link_nxbook_db(%struct.link_t* noundef %0) #0 !dbg !692 {
  %2 = alloca %struct.book*, align 8
  %3 = alloca %struct.link_t*, align 8
  store %struct.link_t* %0, %struct.link_t** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %3, metadata !695, metadata !DIExpression()), !dbg !696
  %4 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !697
  %5 = icmp eq %struct.link_t* %4, null, !dbg !699
  br i1 %5, label %11, label %6, !dbg !700

6:                                                ; preds = %1
  %7 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !701
  %8 = getelementptr inbounds %struct.link_t, %struct.link_t* %7, i32 0, i32 1, !dbg !702
  %9 = load %struct.link_t*, %struct.link_t** %8, align 8, !dbg !702
  %10 = icmp eq %struct.link_t* %9, null, !dbg !703
  br i1 %10, label %11, label %12, !dbg !704

11:                                               ; preds = %6, %1
  store %struct.book* null, %struct.book** %2, align 8, !dbg !705
  br label %19, !dbg !705

12:                                               ; preds = %6
  %13 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !707
  %14 = getelementptr inbounds %struct.link_t, %struct.link_t* %13, i32 0, i32 1, !dbg !707
  %15 = load %struct.link_t*, %struct.link_t** %14, align 8, !dbg !707
  %16 = bitcast %struct.link_t* %15 to i8*, !dbg !707
  %17 = getelementptr inbounds i8, i8* %16, i64 -16, !dbg !707
  %18 = bitcast i8* %17 to %struct.book*, !dbg !707
  store %struct.book* %18, %struct.book** %2, align 8, !dbg !708
  br label %19, !dbg !708

19:                                               ; preds = %12, %11
  %20 = load %struct.book*, %struct.book** %2, align 8, !dbg !709
  ret %struct.book* %20, !dbg !709
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.book* @link_nxbook_au(%struct.link_t* noundef %0) #0 !dbg !710 {
  %2 = alloca %struct.book*, align 8
  %3 = alloca %struct.link_t*, align 8
  store %struct.link_t* %0, %struct.link_t** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %3, metadata !711, metadata !DIExpression()), !dbg !712
  %4 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !713
  %5 = icmp eq %struct.link_t* %4, null, !dbg !715
  br i1 %5, label %11, label %6, !dbg !716

6:                                                ; preds = %1
  %7 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !717
  %8 = getelementptr inbounds %struct.link_t, %struct.link_t* %7, i32 0, i32 1, !dbg !718
  %9 = load %struct.link_t*, %struct.link_t** %8, align 8, !dbg !718
  %10 = icmp eq %struct.link_t* %9, null, !dbg !719
  br i1 %10, label %11, label %12, !dbg !720

11:                                               ; preds = %6, %1
  store %struct.book* null, %struct.book** %2, align 8, !dbg !721
  br label %19, !dbg !721

12:                                               ; preds = %6
  %13 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !723
  %14 = getelementptr inbounds %struct.link_t, %struct.link_t* %13, i32 0, i32 1, !dbg !723
  %15 = load %struct.link_t*, %struct.link_t** %14, align 8, !dbg !723
  %16 = bitcast %struct.link_t* %15 to i8*, !dbg !723
  %17 = getelementptr inbounds i8, i8* %16, i64 -32, !dbg !723
  %18 = bitcast i8* %17 to %struct.book*, !dbg !723
  store %struct.book* %18, %struct.book** %2, align 8, !dbg !724
  br label %19, !dbg !724

19:                                               ; preds = %12, %11
  %20 = load %struct.book*, %struct.book** %2, align 8, !dbg !725
  ret %struct.book* %20, !dbg !725
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.author* @link_nxauthor_db(%struct.link_t* noundef %0) #0 !dbg !726 {
  %2 = alloca %struct.author*, align 8
  %3 = alloca %struct.link_t*, align 8
  store %struct.link_t* %0, %struct.link_t** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %3, metadata !729, metadata !DIExpression()), !dbg !730
  %4 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !731
  %5 = icmp eq %struct.link_t* %4, null, !dbg !733
  br i1 %5, label %11, label %6, !dbg !734

6:                                                ; preds = %1
  %7 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !735
  %8 = getelementptr inbounds %struct.link_t, %struct.link_t* %7, i32 0, i32 1, !dbg !736
  %9 = load %struct.link_t*, %struct.link_t** %8, align 8, !dbg !736
  %10 = icmp eq %struct.link_t* %9, null, !dbg !737
  br i1 %10, label %11, label %12, !dbg !738

11:                                               ; preds = %6, %1
  store %struct.author* null, %struct.author** %2, align 8, !dbg !739
  br label %19, !dbg !739

12:                                               ; preds = %6
  %13 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !741
  %14 = getelementptr inbounds %struct.link_t, %struct.link_t* %13, i32 0, i32 1, !dbg !741
  %15 = load %struct.link_t*, %struct.link_t** %14, align 8, !dbg !741
  %16 = bitcast %struct.link_t* %15 to i8*, !dbg !741
  %17 = getelementptr inbounds i8, i8* %16, i64 -24, !dbg !741
  %18 = bitcast i8* %17 to %struct.author*, !dbg !741
  store %struct.author* %18, %struct.author** %2, align 8, !dbg !742
  br label %19, !dbg !742

19:                                               ; preds = %12, %11
  %20 = load %struct.author*, %struct.author** %2, align 8, !dbg !743
  ret %struct.author* %20, !dbg !743
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.review* @link_nxreview_au(%struct.link_t* noundef %0) #0 !dbg !744 {
  %2 = alloca %struct.review*, align 8
  %3 = alloca %struct.link_t*, align 8
  store %struct.link_t* %0, %struct.link_t** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.link_t** %3, metadata !747, metadata !DIExpression()), !dbg !748
  %4 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !749
  %5 = icmp eq %struct.link_t* %4, null, !dbg !751
  br i1 %5, label %11, label %6, !dbg !752

6:                                                ; preds = %1
  %7 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !753
  %8 = getelementptr inbounds %struct.link_t, %struct.link_t* %7, i32 0, i32 1, !dbg !754
  %9 = load %struct.link_t*, %struct.link_t** %8, align 8, !dbg !754
  %10 = icmp eq %struct.link_t* %9, null, !dbg !755
  br i1 %10, label %11, label %12, !dbg !756

11:                                               ; preds = %6, %1
  store %struct.review* null, %struct.review** %2, align 8, !dbg !757
  br label %19, !dbg !757

12:                                               ; preds = %6
  %13 = load %struct.link_t*, %struct.link_t** %3, align 8, !dbg !759
  %14 = getelementptr inbounds %struct.link_t, %struct.link_t* %13, i32 0, i32 1, !dbg !759
  %15 = load %struct.link_t*, %struct.link_t** %14, align 8, !dbg !759
  %16 = bitcast %struct.link_t* %15 to i8*, !dbg !759
  %17 = getelementptr inbounds i8, i8* %16, i64 -16, !dbg !759
  %18 = bitcast i8* %17 to %struct.review*, !dbg !759
  store %struct.review* %18, %struct.review** %2, align 8, !dbg !760
  br label %19, !dbg !760

19:                                               ; preds = %12, %11
  %20 = load %struct.review*, %struct.review** %2, align 8, !dbg !761
  ret %struct.review* %20, !dbg !761
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.author* @find_author(i8* noundef %0) #0 !dbg !762 {
  %2 = alloca %struct.author*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.author*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !765, metadata !DIExpression()), !dbg !766
  %5 = load %struct.link_t*, %struct.link_t** getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 0, i32 1), align 8, !dbg !767
  %6 = icmp eq %struct.link_t* %5, null, !dbg !769
  br i1 %6, label %7, label %8, !dbg !770

7:                                                ; preds = %1
  store %struct.author* null, %struct.author** %2, align 8, !dbg !771
  br label %31, !dbg !771

8:                                                ; preds = %1
  call void @llvm.dbg.declare(metadata %struct.author** %4, metadata !772, metadata !DIExpression()), !dbg !774
  %9 = load %struct.link_t*, %struct.link_t** getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 0, i32 1), align 8, !dbg !775
  %10 = bitcast %struct.link_t* %9 to i8*, !dbg !775
  %11 = getelementptr inbounds i8, i8* %10, i64 -24, !dbg !775
  %12 = bitcast i8* %11 to %struct.author*, !dbg !775
  store %struct.author* %12, %struct.author** %4, align 8, !dbg !774
  br label %13, !dbg !776

13:                                               ; preds = %26, %8
  %14 = load %struct.author*, %struct.author** %4, align 8, !dbg !777
  %15 = icmp ne %struct.author* %14, null, !dbg !779
  br i1 %15, label %16, label %30, !dbg !780

16:                                               ; preds = %13
  %17 = load %struct.author*, %struct.author** %4, align 8, !dbg !781
  %18 = getelementptr inbounds %struct.author, %struct.author* %17, i32 0, i32 2, !dbg !784
  %19 = load i8*, i8** %18, align 8, !dbg !784
  %20 = load i8*, i8** %3, align 8, !dbg !785
  %21 = call i32 @strcmp(i8* noundef %19, i8* noundef %20) #10, !dbg !786
  %22 = icmp eq i32 %21, 0, !dbg !787
  br i1 %22, label %23, label %25, !dbg !788

23:                                               ; preds = %16
  %24 = load %struct.author*, %struct.author** %4, align 8, !dbg !789
  store %struct.author* %24, %struct.author** %2, align 8, !dbg !790
  br label %31, !dbg !790

25:                                               ; preds = %16
  br label %26, !dbg !791

26:                                               ; preds = %25
  %27 = load %struct.author*, %struct.author** %4, align 8, !dbg !792
  %28 = getelementptr inbounds %struct.author, %struct.author* %27, i32 0, i32 3, !dbg !793
  %29 = call %struct.author* @link_nxauthor_db(%struct.link_t* noundef %28), !dbg !794
  store %struct.author* %29, %struct.author** %4, align 8, !dbg !795
  br label %13, !dbg !796, !llvm.loop !797

30:                                               ; preds = %13
  store %struct.author* null, %struct.author** %2, align 8, !dbg !799
  br label %31, !dbg !799

31:                                               ; preds = %30, %23, %7
  %32 = load %struct.author*, %struct.author** %2, align 8, !dbg !800
  ret %struct.author* %32, !dbg !800
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.book* @find_book(i8* noundef %0) #0 !dbg !801 {
  %2 = alloca %struct.book*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.book*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !804, metadata !DIExpression()), !dbg !805
  %5 = load %struct.link_t*, %struct.link_t** getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 1, i32 1), align 8, !dbg !806
  %6 = icmp eq %struct.link_t* %5, null, !dbg !808
  br i1 %6, label %7, label %8, !dbg !809

7:                                                ; preds = %1
  store %struct.book* null, %struct.book** %2, align 8, !dbg !810
  br label %31, !dbg !810

8:                                                ; preds = %1
  call void @llvm.dbg.declare(metadata %struct.book** %4, metadata !811, metadata !DIExpression()), !dbg !813
  %9 = load %struct.link_t*, %struct.link_t** getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 1, i32 1), align 8, !dbg !814
  %10 = bitcast %struct.link_t* %9 to i8*, !dbg !814
  %11 = getelementptr inbounds i8, i8* %10, i64 -16, !dbg !814
  %12 = bitcast i8* %11 to %struct.book*, !dbg !814
  store %struct.book* %12, %struct.book** %4, align 8, !dbg !813
  br label %13, !dbg !815

13:                                               ; preds = %26, %8
  %14 = load %struct.book*, %struct.book** %4, align 8, !dbg !816
  %15 = icmp ne %struct.book* %14, null, !dbg !818
  br i1 %15, label %16, label %30, !dbg !819

16:                                               ; preds = %13
  %17 = load %struct.book*, %struct.book** %4, align 8, !dbg !820
  %18 = getelementptr inbounds %struct.book, %struct.book* %17, i32 0, i32 0, !dbg !823
  %19 = load i8*, i8** %18, align 8, !dbg !823
  %20 = load i8*, i8** %3, align 8, !dbg !824
  %21 = call i32 @strcmp(i8* noundef %19, i8* noundef %20) #10, !dbg !825
  %22 = icmp eq i32 %21, 0, !dbg !826
  br i1 %22, label %23, label %25, !dbg !827

23:                                               ; preds = %16
  %24 = load %struct.book*, %struct.book** %4, align 8, !dbg !828
  store %struct.book* %24, %struct.book** %2, align 8, !dbg !829
  br label %31, !dbg !829

25:                                               ; preds = %16
  br label %26, !dbg !830

26:                                               ; preds = %25
  %27 = load %struct.book*, %struct.book** %4, align 8, !dbg !831
  %28 = getelementptr inbounds %struct.book, %struct.book* %27, i32 0, i32 2, !dbg !832
  %29 = call %struct.book* @link_nxbook_db(%struct.link_t* noundef %28), !dbg !833
  store %struct.book* %29, %struct.book** %4, align 8, !dbg !834
  br label %13, !dbg !835, !llvm.loop !836

30:                                               ; preds = %13
  store %struct.book* null, %struct.book** %2, align 8, !dbg !838
  br label %31, !dbg !838

31:                                               ; preds = %30, %23, %7
  %32 = load %struct.book*, %struct.book** %2, align 8, !dbg !839
  ret %struct.book* %32, !dbg !839
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_author(%struct.author* noundef %0) #0 !dbg !840 {
  %2 = alloca %struct.author*, align 8
  store %struct.author* %0, %struct.author** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.author** %2, metadata !843, metadata !DIExpression()), !dbg !844
  %3 = load %struct.author*, %struct.author** %2, align 8, !dbg !845
  %4 = getelementptr inbounds %struct.author, %struct.author* %3, i32 0, i32 2, !dbg !847
  %5 = load i8*, i8** %4, align 8, !dbg !847
  %6 = icmp ne i8* %5, null, !dbg !848
  br i1 %6, label %7, label %11, !dbg !849

7:                                                ; preds = %1
  %8 = load %struct.author*, %struct.author** %2, align 8, !dbg !850
  %9 = getelementptr inbounds %struct.author, %struct.author* %8, i32 0, i32 2, !dbg !852
  %10 = load i8*, i8** %9, align 8, !dbg !852
  call void @free(i8* noundef %10) #11, !dbg !853
  br label %11, !dbg !854

11:                                               ; preds = %7, %1
  %12 = load %struct.author*, %struct.author** %2, align 8, !dbg !855
  %13 = getelementptr inbounds %struct.author, %struct.author* %12, i32 0, i32 0, !dbg !857
  %14 = load i8*, i8** %13, align 8, !dbg !857
  %15 = icmp ne i8* %14, null, !dbg !858
  br i1 %15, label %16, label %20, !dbg !859

16:                                               ; preds = %11
  %17 = load %struct.author*, %struct.author** %2, align 8, !dbg !860
  %18 = getelementptr inbounds %struct.author, %struct.author* %17, i32 0, i32 0, !dbg !862
  %19 = load i8*, i8** %18, align 8, !dbg !862
  call void @free(i8* noundef %19) #11, !dbg !863
  br label %20, !dbg !864

20:                                               ; preds = %16, %11
  %21 = load %struct.author*, %struct.author** %2, align 8, !dbg !865
  %22 = getelementptr inbounds %struct.author, %struct.author* %21, i32 0, i32 1, !dbg !867
  %23 = load i8*, i8** %22, align 8, !dbg !867
  %24 = icmp ne i8* %23, null, !dbg !868
  br i1 %24, label %25, label %29, !dbg !869

25:                                               ; preds = %20
  %26 = load %struct.author*, %struct.author** %2, align 8, !dbg !870
  %27 = getelementptr inbounds %struct.author, %struct.author* %26, i32 0, i32 1, !dbg !872
  %28 = load i8*, i8** %27, align 8, !dbg !872
  call void @free(i8* noundef %28) #11, !dbg !873
  br label %29, !dbg !874

29:                                               ; preds = %25, %20
  %30 = load %struct.author*, %struct.author** %2, align 8, !dbg !875
  %31 = bitcast %struct.author* %30 to i8*, !dbg !875
  call void @free(i8* noundef %31) #11, !dbg !876
  ret void, !dbg !877
}

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_book(%struct.book* noundef %0) #0 !dbg !878 {
  %2 = alloca %struct.book*, align 8
  store %struct.book* %0, %struct.book** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.book** %2, metadata !881, metadata !DIExpression()), !dbg !882
  %3 = load %struct.book*, %struct.book** %2, align 8, !dbg !883
  %4 = getelementptr inbounds %struct.book, %struct.book* %3, i32 0, i32 0, !dbg !885
  %5 = load i8*, i8** %4, align 8, !dbg !885
  %6 = icmp ne i8* %5, null, !dbg !886
  br i1 %6, label %7, label %11, !dbg !887

7:                                                ; preds = %1
  %8 = load %struct.book*, %struct.book** %2, align 8, !dbg !888
  %9 = getelementptr inbounds %struct.book, %struct.book* %8, i32 0, i32 0, !dbg !890
  %10 = load i8*, i8** %9, align 8, !dbg !890
  call void @free(i8* noundef %10) #11, !dbg !891
  br label %11, !dbg !892

11:                                               ; preds = %7, %1
  %12 = load %struct.book*, %struct.book** %2, align 8, !dbg !893
  %13 = getelementptr inbounds %struct.book, %struct.book* %12, i32 0, i32 1, !dbg !895
  %14 = load i8*, i8** %13, align 8, !dbg !895
  %15 = icmp ne i8* %14, null, !dbg !896
  br i1 %15, label %16, label %20, !dbg !897

16:                                               ; preds = %11
  %17 = load %struct.book*, %struct.book** %2, align 8, !dbg !898
  %18 = getelementptr inbounds %struct.book, %struct.book* %17, i32 0, i32 1, !dbg !900
  %19 = load i8*, i8** %18, align 8, !dbg !900
  call void @free(i8* noundef %19) #11, !dbg !901
  br label %20, !dbg !902

20:                                               ; preds = %16, %11
  %21 = load %struct.book*, %struct.book** %2, align 8, !dbg !903
  %22 = bitcast %struct.book* %21 to i8*, !dbg !903
  call void @free(i8* noundef %22) #11, !dbg !904
  ret void, !dbg !905
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_book_reviews(%struct.book* noundef %0) #0 !dbg !906 {
  %2 = alloca %struct.book*, align 8
  %3 = alloca %struct.review*, align 8
  %4 = alloca %struct.author*, align 8
  %5 = alloca %struct.review*, align 8
  store %struct.book* %0, %struct.book** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.book** %2, metadata !907, metadata !DIExpression()), !dbg !908
  call void @llvm.dbg.declare(metadata %struct.review** %3, metadata !909, metadata !DIExpression()), !dbg !910
  call void @llvm.dbg.declare(metadata %struct.author** %4, metadata !911, metadata !DIExpression()), !dbg !912
  %6 = load %struct.book*, %struct.book** %2, align 8, !dbg !913
  %7 = getelementptr inbounds %struct.book, %struct.book* %6, i32 0, i32 4, !dbg !914
  %8 = load %struct.author*, %struct.author** %7, align 8, !dbg !914
  store %struct.author* %8, %struct.author** %4, align 8, !dbg !912
  %9 = load %struct.author*, %struct.author** %4, align 8, !dbg !915
  %10 = getelementptr inbounds %struct.author, %struct.author* %9, i32 0, i32 4, !dbg !917
  %11 = getelementptr inbounds %struct.link_t, %struct.link_t* %10, i32 0, i32 1, !dbg !918
  %12 = load %struct.link_t*, %struct.link_t** %11, align 8, !dbg !918
  %13 = icmp eq %struct.link_t* %12, null, !dbg !919
  br i1 %13, label %14, label %15, !dbg !920

14:                                               ; preds = %1
  br label %43, !dbg !921

15:                                               ; preds = %1
  call void @llvm.dbg.declare(metadata %struct.review** %5, metadata !923, metadata !DIExpression()), !dbg !924
  %16 = load %struct.author*, %struct.author** %4, align 8, !dbg !925
  %17 = getelementptr inbounds %struct.author, %struct.author* %16, i32 0, i32 4, !dbg !925
  %18 = getelementptr inbounds %struct.link_t, %struct.link_t* %17, i32 0, i32 1, !dbg !925
  %19 = load %struct.link_t*, %struct.link_t** %18, align 8, !dbg !925
  %20 = bitcast %struct.link_t* %19 to i8*, !dbg !925
  %21 = getelementptr inbounds i8, i8* %20, i64 -16, !dbg !925
  %22 = bitcast i8* %21 to %struct.review*, !dbg !925
  store %struct.review* %22, %struct.review** %5, align 8, !dbg !924
  br label %23, !dbg !926

23:                                               ; preds = %41, %15
  %24 = load %struct.review*, %struct.review** %5, align 8, !dbg !927
  %25 = icmp ne %struct.review* %24, null, !dbg !928
  br i1 %25, label %26, label %42, !dbg !926

26:                                               ; preds = %23
  %27 = load %struct.review*, %struct.review** %5, align 8, !dbg !929
  store %struct.review* %27, %struct.review** %3, align 8, !dbg !931
  %28 = load %struct.review*, %struct.review** %3, align 8, !dbg !932
  %29 = getelementptr inbounds %struct.review, %struct.review* %28, i32 0, i32 2, !dbg !933
  %30 = call %struct.review* @link_nxreview_au(%struct.link_t* noundef %29), !dbg !934
  store %struct.review* %30, %struct.review** %5, align 8, !dbg !935
  %31 = load %struct.review*, %struct.review** %3, align 8, !dbg !936
  %32 = getelementptr inbounds %struct.review, %struct.review* %31, i32 0, i32 0, !dbg !938
  %33 = load %struct.book*, %struct.book** %32, align 8, !dbg !938
  %34 = load %struct.book*, %struct.book** %2, align 8, !dbg !939
  %35 = icmp eq %struct.book* %33, %34, !dbg !940
  br i1 %35, label %36, label %41, !dbg !941

36:                                               ; preds = %26
  %37 = load %struct.review*, %struct.review** %3, align 8, !dbg !942
  %38 = getelementptr inbounds %struct.review, %struct.review* %37, i32 0, i32 2, !dbg !944
  call void @link_unlink(%struct.link_t* noundef %38), !dbg !945
  %39 = load %struct.review*, %struct.review** %3, align 8, !dbg !946
  %40 = bitcast %struct.review* %39 to i8*, !dbg !946
  call void @free(i8* noundef %40) #11, !dbg !947
  br label %41, !dbg !948

41:                                               ; preds = %36, %26
  br label %23, !dbg !926, !llvm.loop !949

42:                                               ; preds = %23
  br label %43, !dbg !951

43:                                               ; preds = %42, %14
  ret void, !dbg !952
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @create_author(i8* noundef %0, i32 noundef %1, i8* noundef %2, i32 noundef %3, i8* noundef %4, i32 noundef %5) #0 !dbg !953 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca %struct.author*, align 8
  store i8* %0, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !957, metadata !DIExpression()), !dbg !958
  store i32 %1, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !959, metadata !DIExpression()), !dbg !960
  store i8* %2, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !961, metadata !DIExpression()), !dbg !962
  store i32 %3, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !963, metadata !DIExpression()), !dbg !964
  store i8* %4, i8** %12, align 8
  call void @llvm.dbg.declare(metadata i8** %12, metadata !965, metadata !DIExpression()), !dbg !966
  store i32 %5, i32* %13, align 4
  call void @llvm.dbg.declare(metadata i32* %13, metadata !967, metadata !DIExpression()), !dbg !968
  call void @llvm.dbg.declare(metadata %struct.author** %14, metadata !969, metadata !DIExpression()), !dbg !970
  %15 = call i8* @alloc_struct(i64 noundef 72), !dbg !971
  %16 = bitcast i8* %15 to %struct.author*, !dbg !971
  store %struct.author* %16, %struct.author** %14, align 8, !dbg !970
  %17 = load %struct.author*, %struct.author** %14, align 8, !dbg !972
  %18 = icmp eq %struct.author* %17, null, !dbg !974
  br i1 %18, label %19, label %20, !dbg !975

19:                                               ; preds = %6
  store i32 1, i32* %7, align 4, !dbg !976
  br label %107, !dbg !976

20:                                               ; preds = %6
  %21 = load %struct.author*, %struct.author** %14, align 8, !dbg !978
  %22 = getelementptr inbounds %struct.author, %struct.author* %21, i32 0, i32 3, !dbg !979
  call void @link_init(%struct.link_t* noundef %22), !dbg !980
  %23 = load %struct.author*, %struct.author** %14, align 8, !dbg !981
  %24 = getelementptr inbounds %struct.author, %struct.author* %23, i32 0, i32 4, !dbg !982
  call void @link_init(%struct.link_t* noundef %24), !dbg !983
  %25 = load %struct.author*, %struct.author** %14, align 8, !dbg !984
  %26 = getelementptr inbounds %struct.author, %struct.author* %25, i32 0, i32 5, !dbg !985
  call void @link_init(%struct.link_t* noundef %26), !dbg !986
  %27 = load i32, i32* %9, align 4, !dbg !987
  %28 = sext i32 %27 to i64, !dbg !987
  %29 = call noalias i8* @malloc(i64 noundef %28) #11, !dbg !988
  %30 = load %struct.author*, %struct.author** %14, align 8, !dbg !989
  %31 = getelementptr inbounds %struct.author, %struct.author* %30, i32 0, i32 2, !dbg !990
  store i8* %29, i8** %31, align 8, !dbg !991
  %32 = load %struct.author*, %struct.author** %14, align 8, !dbg !992
  %33 = getelementptr inbounds %struct.author, %struct.author* %32, i32 0, i32 2, !dbg !994
  %34 = load i8*, i8** %33, align 8, !dbg !994
  %35 = icmp eq i8* %34, null, !dbg !995
  br i1 %35, label %36, label %38, !dbg !996

36:                                               ; preds = %20
  %37 = load %struct.author*, %struct.author** %14, align 8, !dbg !997
  call void @free_author(%struct.author* noundef %37), !dbg !999
  store i32 1, i32* %7, align 4, !dbg !1000
  br label %107, !dbg !1000

38:                                               ; preds = %20
  %39 = load %struct.author*, %struct.author** %14, align 8, !dbg !1001
  %40 = getelementptr inbounds %struct.author, %struct.author* %39, i32 0, i32 2, !dbg !1002
  %41 = load i8*, i8** %40, align 8, !dbg !1002
  %42 = load i8*, i8** %8, align 8, !dbg !1003
  %43 = load i32, i32* %9, align 4, !dbg !1004
  %44 = sext i32 %43 to i64, !dbg !1004
  %45 = call i8* @memcpy(i8* %41, i8* %42, i64 %44), !dbg !1005
  %46 = load %struct.author*, %struct.author** %14, align 8, !dbg !1006
  %47 = getelementptr inbounds %struct.author, %struct.author* %46, i32 0, i32 2, !dbg !1007
  %48 = load i8*, i8** %47, align 8, !dbg !1007
  %49 = load i32, i32* %9, align 4, !dbg !1008
  %50 = sub nsw i32 %49, 1, !dbg !1009
  %51 = sext i32 %50 to i64, !dbg !1006
  %52 = getelementptr inbounds i8, i8* %48, i64 %51, !dbg !1006
  store i8 0, i8* %52, align 1, !dbg !1010
  %53 = load i32, i32* %11, align 4, !dbg !1011
  %54 = sext i32 %53 to i64, !dbg !1011
  %55 = call noalias i8* @malloc(i64 noundef %54) #11, !dbg !1012
  %56 = load %struct.author*, %struct.author** %14, align 8, !dbg !1013
  %57 = getelementptr inbounds %struct.author, %struct.author* %56, i32 0, i32 0, !dbg !1014
  store i8* %55, i8** %57, align 8, !dbg !1015
  %58 = load %struct.author*, %struct.author** %14, align 8, !dbg !1016
  %59 = getelementptr inbounds %struct.author, %struct.author* %58, i32 0, i32 0, !dbg !1018
  %60 = load i8*, i8** %59, align 8, !dbg !1018
  %61 = icmp eq i8* %60, null, !dbg !1019
  br i1 %61, label %62, label %64, !dbg !1020

62:                                               ; preds = %38
  %63 = load %struct.author*, %struct.author** %14, align 8, !dbg !1021
  call void @free_author(%struct.author* noundef %63), !dbg !1023
  store i32 1, i32* %7, align 4, !dbg !1024
  br label %107, !dbg !1024

64:                                               ; preds = %38
  %65 = load %struct.author*, %struct.author** %14, align 8, !dbg !1025
  %66 = getelementptr inbounds %struct.author, %struct.author* %65, i32 0, i32 0, !dbg !1026
  %67 = load i8*, i8** %66, align 8, !dbg !1026
  %68 = load i8*, i8** %10, align 8, !dbg !1027
  %69 = load i32, i32* %11, align 4, !dbg !1028
  %70 = sext i32 %69 to i64, !dbg !1028
  %71 = call i8* @memcpy(i8* %67, i8* %68, i64 %70), !dbg !1029
  %72 = load %struct.author*, %struct.author** %14, align 8, !dbg !1030
  %73 = getelementptr inbounds %struct.author, %struct.author* %72, i32 0, i32 0, !dbg !1031
  %74 = load i8*, i8** %73, align 8, !dbg !1031
  %75 = load i32, i32* %11, align 4, !dbg !1032
  %76 = sub nsw i32 %75, 1, !dbg !1033
  %77 = sext i32 %76 to i64, !dbg !1030
  %78 = getelementptr inbounds i8, i8* %74, i64 %77, !dbg !1030
  store i8 0, i8* %78, align 1, !dbg !1034
  %79 = load i32, i32* %13, align 4, !dbg !1035
  %80 = sext i32 %79 to i64, !dbg !1035
  %81 = call noalias i8* @malloc(i64 noundef %80) #11, !dbg !1036
  %82 = load %struct.author*, %struct.author** %14, align 8, !dbg !1037
  %83 = getelementptr inbounds %struct.author, %struct.author* %82, i32 0, i32 1, !dbg !1038
  store i8* %81, i8** %83, align 8, !dbg !1039
  %84 = load %struct.author*, %struct.author** %14, align 8, !dbg !1040
  %85 = getelementptr inbounds %struct.author, %struct.author* %84, i32 0, i32 1, !dbg !1042
  %86 = load i8*, i8** %85, align 8, !dbg !1042
  %87 = icmp eq i8* %86, null, !dbg !1043
  br i1 %87, label %88, label %90, !dbg !1044

88:                                               ; preds = %64
  %89 = load %struct.author*, %struct.author** %14, align 8, !dbg !1045
  call void @free_author(%struct.author* noundef %89), !dbg !1047
  store i32 1, i32* %7, align 4, !dbg !1048
  br label %107, !dbg !1048

90:                                               ; preds = %64
  %91 = load %struct.author*, %struct.author** %14, align 8, !dbg !1049
  %92 = getelementptr inbounds %struct.author, %struct.author* %91, i32 0, i32 1, !dbg !1050
  %93 = load i8*, i8** %92, align 8, !dbg !1050
  %94 = load i8*, i8** %12, align 8, !dbg !1051
  %95 = load i32, i32* %13, align 4, !dbg !1052
  %96 = sext i32 %95 to i64, !dbg !1052
  %97 = call i8* @memcpy(i8* %93, i8* %94, i64 %96), !dbg !1053
  %98 = load %struct.author*, %struct.author** %14, align 8, !dbg !1054
  %99 = getelementptr inbounds %struct.author, %struct.author* %98, i32 0, i32 1, !dbg !1055
  %100 = load i8*, i8** %99, align 8, !dbg !1055
  %101 = load i32, i32* %13, align 4, !dbg !1056
  %102 = sub nsw i32 %101, 1, !dbg !1057
  %103 = sext i32 %102 to i64, !dbg !1054
  %104 = getelementptr inbounds i8, i8* %100, i64 %103, !dbg !1054
  store i8 0, i8* %104, align 1, !dbg !1058
  %105 = load %struct.author*, %struct.author** %14, align 8, !dbg !1059
  %106 = getelementptr inbounds %struct.author, %struct.author* %105, i32 0, i32 3, !dbg !1060
  call void @link_prepend(%struct.link_t* noundef getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 0), %struct.link_t* noundef %106), !dbg !1061
  store i32 0, i32* %7, align 4, !dbg !1062
  br label %107, !dbg !1062

107:                                              ; preds = %90, %88, %62, %36, %19
  %108 = load i32, i32* %7, align 4, !dbg !1063
  ret i32 %108, !dbg !1063
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @create_book(i8* noundef %0, i8* noundef %1, i32 noundef %2, i8* noundef %3, i32 noundef %4) #0 !dbg !1064 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.book*, align 8
  store i8* %0, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1067, metadata !DIExpression()), !dbg !1068
  store i8* %1, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !1069, metadata !DIExpression()), !dbg !1070
  store i32 %2, i32* %9, align 4
  call void @llvm.dbg.declare(metadata i32* %9, metadata !1071, metadata !DIExpression()), !dbg !1072
  store i8* %3, i8** %10, align 8
  call void @llvm.dbg.declare(metadata i8** %10, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i32 %4, i32* %11, align 4
  call void @llvm.dbg.declare(metadata i32* %11, metadata !1075, metadata !DIExpression()), !dbg !1076
  call void @llvm.dbg.declare(metadata i8** %12, metadata !1077, metadata !DIExpression()), !dbg !1078
  call void @llvm.dbg.declare(metadata %struct.book** %13, metadata !1079, metadata !DIExpression()), !dbg !1080
  %14 = call i8* @alloc_struct(i64 noundef 56), !dbg !1081
  %15 = bitcast i8* %14 to %struct.book*, !dbg !1081
  store %struct.book* %15, %struct.book** %13, align 8, !dbg !1080
  %16 = load %struct.book*, %struct.book** %13, align 8, !dbg !1082
  %17 = icmp eq %struct.book* %16, null, !dbg !1084
  br i1 %17, label %18, label %19, !dbg !1085

18:                                               ; preds = %5
  store i32 1, i32* %6, align 4, !dbg !1086
  br label %91, !dbg !1086

19:                                               ; preds = %5
  %20 = load i8*, i8** %7, align 8, !dbg !1088
  %21 = call %struct.author* @find_author(i8* noundef %20), !dbg !1089
  %22 = load %struct.book*, %struct.book** %13, align 8, !dbg !1090
  %23 = getelementptr inbounds %struct.book, %struct.book* %22, i32 0, i32 4, !dbg !1091
  store %struct.author* %21, %struct.author** %23, align 8, !dbg !1092
  %24 = load %struct.book*, %struct.book** %13, align 8, !dbg !1093
  %25 = getelementptr inbounds %struct.book, %struct.book* %24, i32 0, i32 4, !dbg !1095
  %26 = load %struct.author*, %struct.author** %25, align 8, !dbg !1095
  %27 = icmp eq %struct.author* %26, null, !dbg !1096
  br i1 %27, label %28, label %30, !dbg !1097

28:                                               ; preds = %19
  %29 = load %struct.book*, %struct.book** %13, align 8, !dbg !1098
  call void @free_book(%struct.book* noundef %29), !dbg !1100
  store i32 2, i32* %6, align 4, !dbg !1101
  br label %91, !dbg !1101

30:                                               ; preds = %19
  %31 = load i32, i32* %9, align 4, !dbg !1102
  %32 = sext i32 %31 to i64, !dbg !1102
  %33 = call noalias i8* @malloc(i64 noundef %32) #11, !dbg !1103
  %34 = load %struct.book*, %struct.book** %13, align 8, !dbg !1104
  %35 = getelementptr inbounds %struct.book, %struct.book* %34, i32 0, i32 0, !dbg !1105
  store i8* %33, i8** %35, align 8, !dbg !1106
  %36 = load %struct.book*, %struct.book** %13, align 8, !dbg !1107
  %37 = getelementptr inbounds %struct.book, %struct.book* %36, i32 0, i32 0, !dbg !1109
  %38 = load i8*, i8** %37, align 8, !dbg !1109
  %39 = icmp eq i8* %38, null, !dbg !1110
  br i1 %39, label %40, label %42, !dbg !1111

40:                                               ; preds = %30
  %41 = load %struct.book*, %struct.book** %13, align 8, !dbg !1112
  call void @free_book(%struct.book* noundef %41), !dbg !1114
  store i32 1, i32* %6, align 4, !dbg !1115
  br label %91, !dbg !1115

42:                                               ; preds = %30
  %43 = load %struct.book*, %struct.book** %13, align 8, !dbg !1116
  %44 = getelementptr inbounds %struct.book, %struct.book* %43, i32 0, i32 0, !dbg !1117
  %45 = load i8*, i8** %44, align 8, !dbg !1117
  %46 = load i8*, i8** %8, align 8, !dbg !1118
  %47 = load i32, i32* %9, align 4, !dbg !1119
  %48 = sext i32 %47 to i64, !dbg !1119
  %49 = call i8* @memcpy(i8* %45, i8* %46, i64 %48), !dbg !1120
  %50 = load %struct.book*, %struct.book** %13, align 8, !dbg !1121
  %51 = getelementptr inbounds %struct.book, %struct.book* %50, i32 0, i32 0, !dbg !1122
  %52 = load i8*, i8** %51, align 8, !dbg !1122
  %53 = load i32, i32* %9, align 4, !dbg !1123
  %54 = sub nsw i32 %53, 1, !dbg !1124
  %55 = sext i32 %54 to i64, !dbg !1121
  %56 = getelementptr inbounds i8, i8* %52, i64 %55, !dbg !1121
  store i8 0, i8* %56, align 1, !dbg !1125
  %57 = load i32, i32* %11, align 4, !dbg !1126
  %58 = sext i32 %57 to i64, !dbg !1126
  %59 = call noalias i8* @malloc(i64 noundef %58) #11, !dbg !1127
  %60 = load %struct.book*, %struct.book** %13, align 8, !dbg !1128
  %61 = getelementptr inbounds %struct.book, %struct.book* %60, i32 0, i32 1, !dbg !1129
  store i8* %59, i8** %61, align 8, !dbg !1130
  %62 = load %struct.book*, %struct.book** %13, align 8, !dbg !1131
  %63 = getelementptr inbounds %struct.book, %struct.book* %62, i32 0, i32 1, !dbg !1133
  %64 = load i8*, i8** %63, align 8, !dbg !1133
  %65 = icmp eq i8* %64, null, !dbg !1134
  br i1 %65, label %66, label %68, !dbg !1135

66:                                               ; preds = %42
  %67 = load %struct.book*, %struct.book** %13, align 8, !dbg !1136
  call void @free_book(%struct.book* noundef %67), !dbg !1138
  store i32 1, i32* %6, align 4, !dbg !1139
  br label %91, !dbg !1139

68:                                               ; preds = %42
  %69 = load %struct.book*, %struct.book** %13, align 8, !dbg !1140
  %70 = getelementptr inbounds %struct.book, %struct.book* %69, i32 0, i32 1, !dbg !1141
  %71 = load i8*, i8** %70, align 8, !dbg !1141
  %72 = load i8*, i8** %10, align 8, !dbg !1142
  %73 = load i32, i32* %11, align 4, !dbg !1143
  %74 = sext i32 %73 to i64, !dbg !1143
  %75 = call i8* @memcpy(i8* %71, i8* %72, i64 %74), !dbg !1144
  %76 = load %struct.book*, %struct.book** %13, align 8, !dbg !1145
  %77 = getelementptr inbounds %struct.book, %struct.book* %76, i32 0, i32 1, !dbg !1146
  %78 = load i8*, i8** %77, align 8, !dbg !1146
  %79 = load i32, i32* %11, align 4, !dbg !1147
  %80 = sub nsw i32 %79, 1, !dbg !1148
  %81 = sext i32 %80 to i64, !dbg !1145
  %82 = getelementptr inbounds i8, i8* %78, i64 %81, !dbg !1145
  store i8 0, i8* %82, align 1, !dbg !1149
  %83 = load %struct.book*, %struct.book** %13, align 8, !dbg !1150
  %84 = getelementptr inbounds %struct.book, %struct.book* %83, i32 0, i32 2, !dbg !1151
  call void @link_prepend(%struct.link_t* noundef getelementptr inbounds (%struct.database, %struct.database* @db, i32 0, i32 1), %struct.link_t* noundef %84), !dbg !1152
  %85 = load %struct.book*, %struct.book** %13, align 8, !dbg !1153
  %86 = getelementptr inbounds %struct.book, %struct.book* %85, i32 0, i32 4, !dbg !1154
  %87 = load %struct.author*, %struct.author** %86, align 8, !dbg !1154
  %88 = getelementptr inbounds %struct.author, %struct.author* %87, i32 0, i32 5, !dbg !1155
  %89 = load %struct.book*, %struct.book** %13, align 8, !dbg !1156
  %90 = getelementptr inbounds %struct.book, %struct.book* %89, i32 0, i32 3, !dbg !1157
  call void @link_prepend(%struct.link_t* noundef %88, %struct.link_t* noundef %90), !dbg !1158
  store i32 0, i32* %6, align 4, !dbg !1159
  br label %91, !dbg !1159

91:                                               ; preds = %68, %66, %40, %28, %18
  %92 = load i32, i32* %6, align 4, !dbg !1160
  ret i32 %92, !dbg !1160
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @create_review(i8* noundef %0, i32 noundef %1) #0 !dbg !1161 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.book*, align 8
  %7 = alloca %struct.author*, align 8
  %8 = alloca %struct.review*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1165, metadata !DIExpression()), !dbg !1166
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !1167, metadata !DIExpression()), !dbg !1168
  %9 = load i32, i32* %5, align 4, !dbg !1169
  %10 = icmp slt i32 %9, 0, !dbg !1171
  br i1 %10, label %14, label %11, !dbg !1172

11:                                               ; preds = %2
  %12 = load i32, i32* %5, align 4, !dbg !1173
  %13 = icmp sgt i32 %12, 5, !dbg !1174
  br i1 %13, label %14, label %15, !dbg !1175

14:                                               ; preds = %11, %2
  store i32 1, i32* %3, align 4, !dbg !1176
  br label %49, !dbg !1176

15:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata %struct.book** %6, metadata !1177, metadata !DIExpression()), !dbg !1178
  %16 = load i8*, i8** %4, align 8, !dbg !1179
  %17 = call %struct.book* @find_book(i8* noundef %16), !dbg !1180
  store %struct.book* %17, %struct.book** %6, align 8, !dbg !1178
  %18 = load %struct.book*, %struct.book** %6, align 8, !dbg !1181
  %19 = icmp eq %struct.book* %18, null, !dbg !1183
  br i1 %19, label %20, label %21, !dbg !1184

20:                                               ; preds = %15
  store i32 1, i32* %3, align 4, !dbg !1185
  br label %49, !dbg !1185

21:                                               ; preds = %15
  call void @llvm.dbg.declare(metadata %struct.author** %7, metadata !1187, metadata !DIExpression()), !dbg !1188
  %22 = load %struct.book*, %struct.book** %6, align 8, !dbg !1189
  %23 = getelementptr inbounds %struct.book, %struct.book* %22, i32 0, i32 4, !dbg !1190
  %24 = load %struct.author*, %struct.author** %23, align 8, !dbg !1190
  store %struct.author* %24, %struct.author** %7, align 8, !dbg !1188
  %25 = load %struct.author*, %struct.author** %7, align 8, !dbg !1191
  %26 = icmp ne %struct.author* %25, null, !dbg !1191
  br i1 %26, label %27, label %28, !dbg !1194

27:                                               ; preds = %21
  br label %29, !dbg !1194

28:                                               ; preds = %21
  call void @__assert_fail(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.6, i64 0, i64 0), i32 noundef 226, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.create_review, i64 0, i64 0)) #12, !dbg !1191
  unreachable, !dbg !1191

29:                                               ; preds = %27
  call void @llvm.dbg.declare(metadata %struct.review** %8, metadata !1195, metadata !DIExpression()), !dbg !1196
  %30 = call i8* @alloc_struct(i64 noundef 40), !dbg !1197
  %31 = bitcast i8* %30 to %struct.review*, !dbg !1197
  store %struct.review* %31, %struct.review** %8, align 8, !dbg !1196
  %32 = load %struct.review*, %struct.review** %8, align 8, !dbg !1198
  %33 = icmp eq %struct.review* %32, null, !dbg !1200
  br i1 %33, label %34, label %35, !dbg !1201

34:                                               ; preds = %29
  store i32 2, i32* %3, align 4, !dbg !1202
  br label %49, !dbg !1202

35:                                               ; preds = %29
  %36 = load i32, i32* %5, align 4, !dbg !1204
  %37 = load %struct.review*, %struct.review** %8, align 8, !dbg !1205
  %38 = getelementptr inbounds %struct.review, %struct.review* %37, i32 0, i32 3, !dbg !1206
  store i32 %36, i32* %38, align 8, !dbg !1207
  %39 = load %struct.book*, %struct.book** %6, align 8, !dbg !1208
  %40 = load %struct.review*, %struct.review** %8, align 8, !dbg !1209
  %41 = getelementptr inbounds %struct.review, %struct.review* %40, i32 0, i32 0, !dbg !1210
  store %struct.book* %39, %struct.book** %41, align 8, !dbg !1211
  %42 = load %struct.author*, %struct.author** %7, align 8, !dbg !1212
  %43 = load %struct.review*, %struct.review** %8, align 8, !dbg !1213
  %44 = getelementptr inbounds %struct.review, %struct.review* %43, i32 0, i32 1, !dbg !1214
  store %struct.author* %42, %struct.author** %44, align 8, !dbg !1215
  %45 = load %struct.author*, %struct.author** %7, align 8, !dbg !1216
  %46 = getelementptr inbounds %struct.author, %struct.author* %45, i32 0, i32 4, !dbg !1217
  %47 = load %struct.review*, %struct.review** %8, align 8, !dbg !1218
  %48 = getelementptr inbounds %struct.review, %struct.review* %47, i32 0, i32 2, !dbg !1219
  call void @link_prepend(%struct.link_t* noundef %46, %struct.link_t* noundef %48), !dbg !1220
  store i32 0, i32* %3, align 4, !dbg !1221
  br label %49, !dbg !1221

49:                                               ; preds = %35, %34, %20, %14
  %50 = load i32, i32* %3, align 4, !dbg !1222
  ret i32 %50, !dbg !1222
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @delete_author(i8* noundef %0) #0 !dbg !1223 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca %struct.author*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1227, metadata !DIExpression()), !dbg !1228
  call void @llvm.dbg.declare(metadata %struct.author** %4, metadata !1229, metadata !DIExpression()), !dbg !1230
  %5 = load i8*, i8** %3, align 8, !dbg !1231
  %6 = call %struct.author* @find_author(i8* noundef %5), !dbg !1232
  store %struct.author* %6, %struct.author** %4, align 8, !dbg !1230
  %7 = load %struct.author*, %struct.author** %4, align 8, !dbg !1233
  %8 = icmp eq %struct.author* %7, null, !dbg !1235
  br i1 %8, label %9, label %10, !dbg !1236

9:                                                ; preds = %1
  store i32 1, i32* %2, align 4, !dbg !1237
  br label %14, !dbg !1237

10:                                               ; preds = %1
  %11 = load %struct.author*, %struct.author** %4, align 8, !dbg !1239
  %12 = getelementptr inbounds %struct.author, %struct.author* %11, i32 0, i32 3, !dbg !1240
  call void @link_unlink(%struct.link_t* noundef %12), !dbg !1241
  %13 = load %struct.author*, %struct.author** %4, align 8, !dbg !1242
  call void @free_author(%struct.author* noundef %13), !dbg !1243
  store i32 0, i32* %2, align 4, !dbg !1244
  br label %14, !dbg !1244

14:                                               ; preds = %10, %9
  %15 = load i32, i32* %2, align 4, !dbg !1245
  ret i32 %15, !dbg !1245
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @delete_book(i8* noundef %0) #0 !dbg !1246 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca %struct.review*, align 8
  %5 = alloca %struct.book*, align 8
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !1247, metadata !DIExpression()), !dbg !1248
  call void @llvm.dbg.declare(metadata %struct.review** %4, metadata !1249, metadata !DIExpression()), !dbg !1250
  call void @llvm.dbg.declare(metadata %struct.book** %5, metadata !1251, metadata !DIExpression()), !dbg !1252
  %6 = load i8*, i8** %3, align 8, !dbg !1253
  %7 = call %struct.book* @find_book(i8* noundef %6), !dbg !1254
  store %struct.book* %7, %struct.book** %5, align 8, !dbg !1252
  %8 = load %struct.book*, %struct.book** %5, align 8, !dbg !1255
  %9 = icmp eq %struct.book* %8, null, !dbg !1257
  br i1 %9, label %10, label %11, !dbg !1258

10:                                               ; preds = %1
  store i32 1, i32* %2, align 4, !dbg !1259
  br label %18, !dbg !1259

11:                                               ; preds = %1
  %12 = load %struct.book*, %struct.book** %5, align 8, !dbg !1261
  call void @free_book_reviews(%struct.book* noundef %12), !dbg !1262
  %13 = load %struct.book*, %struct.book** %5, align 8, !dbg !1263
  %14 = getelementptr inbounds %struct.book, %struct.book* %13, i32 0, i32 2, !dbg !1264
  call void @link_unlink(%struct.link_t* noundef %14), !dbg !1265
  %15 = load %struct.book*, %struct.book** %5, align 8, !dbg !1266
  %16 = getelementptr inbounds %struct.book, %struct.book* %15, i32 0, i32 3, !dbg !1267
  call void @link_unlink(%struct.link_t* noundef %16), !dbg !1268
  %17 = load %struct.book*, %struct.book** %5, align 8, !dbg !1269
  call void @free_book(%struct.book* noundef %17), !dbg !1270
  store i32 0, i32* %2, align 4, !dbg !1271
  br label %18, !dbg !1271

18:                                               ; preds = %11, %10
  %19 = load i32, i32* %2, align 4, !dbg !1272
  ret i32 %19, !dbg !1272
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8* noundef %0, i8* noundef %1, i64 noundef %2) #9 !dbg !1273 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1279, metadata !DIExpression()), !dbg !1280
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !1281, metadata !DIExpression()), !dbg !1282
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1283, metadata !DIExpression()), !dbg !1284
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1285, metadata !DIExpression()), !dbg !1286
  %9 = load i8*, i8** %4, align 8, !dbg !1287
  store i8* %9, i8** %7, align 8, !dbg !1286
  call void @llvm.dbg.declare(metadata i8** %8, metadata !1288, metadata !DIExpression()), !dbg !1289
  %10 = load i8*, i8** %5, align 8, !dbg !1290
  store i8* %10, i8** %8, align 8, !dbg !1289
  br label %11, !dbg !1291

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !1292
  %13 = add i64 %12, -1, !dbg !1292
  store i64 %13, i64* %6, align 8, !dbg !1292
  %14 = icmp ugt i64 %12, 0, !dbg !1293
  br i1 %14, label %15, label %21, !dbg !1291

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !1294
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !1294
  store i8* %17, i8** %8, align 8, !dbg !1294
  %18 = load i8, i8* %16, align 1, !dbg !1295
  %19 = load i8*, i8** %7, align 8, !dbg !1296
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !1296
  store i8* %20, i8** %7, align 8, !dbg !1296
  store i8 %18, i8* %19, align 1, !dbg !1297
  br label %11, !dbg !1291, !llvm.loop !1298

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !1299
  ret i8* %22, !dbg !1300
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memset(i8* noundef %0, i32 noundef %1, i64 noundef %2) #9 !dbg !1301 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1305, metadata !DIExpression()), !dbg !1306
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !1307, metadata !DIExpression()), !dbg !1308
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1309, metadata !DIExpression()), !dbg !1310
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1311, metadata !DIExpression()), !dbg !1312
  %8 = load i8*, i8** %4, align 8, !dbg !1313
  store i8* %8, i8** %7, align 8, !dbg !1312
  br label %9, !dbg !1314

9:                                                ; preds = %13, %3
  %10 = load i64, i64* %6, align 8, !dbg !1315
  %11 = add i64 %10, -1, !dbg !1315
  store i64 %11, i64* %6, align 8, !dbg !1315
  %12 = icmp ugt i64 %10, 0, !dbg !1316
  br i1 %12, label %13, label %18, !dbg !1314

13:                                               ; preds = %9
  %14 = load i32, i32* %5, align 4, !dbg !1317
  %15 = trunc i32 %14 to i8, !dbg !1317
  %16 = load i8*, i8** %7, align 8, !dbg !1318
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !1318
  store i8* %17, i8** %7, align 8, !dbg !1318
  store i8 %15, i8* %16, align 1, !dbg !1319
  br label %9, !dbg !1314, !llvm.loop !1320

18:                                               ; preds = %9
  %19 = load i8*, i8** %4, align 8, !dbg !1321
  ret i8* %19, !dbg !1322
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind optnone readonly uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline noreturn nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree nounwind willreturn writeonly }
attributes #8 = { argmemonly nofree nounwind willreturn }
attributes #9 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind readonly willreturn }
attributes #11 = { nounwind }
attributes #12 = { noreturn nounwind }

!llvm.dbg.cu = !{!79, !2, !12, !109, !111}
!llvm.ident = !{!113, !113, !113, !113, !113}
!llvm.module.flags = !{!114, !115, !116, !117, !118, !119, !120}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "stdin", scope: !2, file: !3, line: 17, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "stubs_demo.c", directory: "/root/2-bookshelf/demo_klee", checksumkind: CSK_MD5, checksum: "469330ce767c1d357e5763f572824a03")
!4 = !{!5, !6}
!5 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!0}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "db", scope: !12, file: !13, line: 3, type: !74, isLocal: false, isDefinition: true)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Ubuntu clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !14, retainedTypes: !32, globals: !73, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "../bookshelf.c", directory: "/root/2-bookshelf/demo_klee", checksumkind: CSK_MD5, checksum: "1013b1202ab590c65f8b018b1be9cc66")
!14 = !{!15, !22, !28}
!15 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !16, line: 11, baseType: !17, size: 32, elements: !18)
!16 = !DIFile(filename: "../bookshelf.h", directory: "/root/2-bookshelf/demo_klee", checksumkind: CSK_MD5, checksum: "94234ea2c7b5700b6b528156feaafefd")
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !{!19, !20, !21}
!19 = !DIEnumerator(name: "CRT_SUCCESS", value: 0)
!20 = !DIEnumerator(name: "CRT_NO_RESOURCES", value: 1)
!21 = !DIEnumerator(name: "CRT_INVALID_PARAM", value: 2)
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !16, line: 22, baseType: !17, size: 32, elements: !23)
!23 = !{!24, !25, !26, !27}
!24 = !DIEnumerator(name: "EDT_SUCCESS", value: 0)
!25 = !DIEnumerator(name: "EDT_INVALID_PARAM", value: 1)
!26 = !DIEnumerator(name: "EDT_NO_RESOURCES", value: 2)
!27 = !DIEnumerator(name: "EDT_BAD_POINTER", value: 3)
!28 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !16, line: 17, baseType: !17, size: 32, elements: !29)
!29 = !{!30, !31}
!30 = !DIEnumerator(name: "DEL_SUCCESS", value: 0)
!31 = !DIEnumerator(name: "DEL_INVALID_PARAM", value: 1)
!32 = !{!9, !33, !41, !6, !50, !60}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "link_t", file: !16, line: 32, baseType: !35)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "link_t", file: !16, line: 29, size: 128, elements: !36)
!36 = !{!37, !40}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "backward", scope: !35, file: !16, line: 30, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "link_t", file: !16, line: 7, baseType: !35)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "forward", scope: !35, file: !16, line: 31, baseType: !38, size: 64, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "book", file: !16, line: 56, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "book", file: !16, line: 50, size: 448, elements: !44)
!44 = !{!45, !46, !47, !48, !49}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !43, file: !16, line: 51, baseType: !6, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "description", scope: !43, file: !16, line: 52, baseType: !6, size: 64, offset: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "db_link", scope: !43, file: !16, line: 53, baseType: !34, size: 128, offset: 128)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "au_link", scope: !43, file: !16, line: 54, baseType: !34, size: 128, offset: 256)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "author", scope: !43, file: !16, line: 55, baseType: !50, size: 64, offset: 384)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "author", file: !16, line: 48, baseType: !52)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "author", file: !16, line: 41, size: 576, elements: !53)
!53 = !{!54, !55, !56, !57, !58, !59}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "publisher", scope: !52, file: !16, line: 42, baseType: !6, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "description", scope: !52, file: !16, line: 43, baseType: !6, size: 64, offset: 64)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !52, file: !16, line: 44, baseType: !6, size: 64, offset: 128)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "db_link", scope: !52, file: !16, line: 45, baseType: !34, size: 128, offset: 192)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "reviews", scope: !52, file: !16, line: 46, baseType: !34, size: 128, offset: 320)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "books", scope: !52, file: !16, line: 47, baseType: !34, size: 128, offset: 448)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "review", file: !16, line: 39, baseType: !62)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "review", file: !16, line: 34, size: 320, elements: !63)
!63 = !{!64, !67, !70, !71}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "book", scope: !62, file: !16, line: 35, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "book", file: !16, line: 9, baseType: !43)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "author", scope: !62, file: !16, line: 36, baseType: !68, size: 64, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "author", file: !16, line: 8, baseType: !52)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "au_link", scope: !62, file: !16, line: 37, baseType: !34, size: 128, offset: 128)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "rating", scope: !62, file: !16, line: 38, baseType: !72, size: 32, offset: 256)
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !{!10}
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "database", file: !16, line: 61, baseType: !75)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "database", file: !16, line: 58, size: 256, elements: !76)
!76 = !{!77, !78}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "authors", scope: !75, file: !16, line: 59, baseType: !34, size: 128)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "books", scope: !75, file: !16, line: 60, baseType: !34, size: 128, offset: 128)
!79 = distinct !DICompileUnit(language: DW_LANG_C99, file: !80, producer: "Ubuntu clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !81, splitDebugInlining: false, nameTableKind: None)
!80 = !DIFile(filename: "driver_uaf_demo.c", directory: "/root/2-bookshelf/demo_klee", checksumkind: CSK_MD5, checksum: "f5303e47486bc2b972f29429e4996d72")
!81 = !{!9, !82, !6}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "book", file: !84, line: 56, baseType: !85)
!84 = !DIFile(filename: "./../bookshelf.h", directory: "/root/2-bookshelf/demo_klee", checksumkind: CSK_MD5, checksum: "94234ea2c7b5700b6b528156feaafefd")
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "book", file: !84, line: 50, size: 448, elements: !86)
!86 = !{!87, !88, !89, !97, !98}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !85, file: !84, line: 51, baseType: !6, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "description", scope: !85, file: !84, line: 52, baseType: !6, size: 64, offset: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "db_link", scope: !85, file: !84, line: 53, baseType: !90, size: 128, offset: 128)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "link_t", file: !84, line: 32, baseType: !91)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "link_t", file: !84, line: 29, size: 128, elements: !92)
!92 = !{!93, !96}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "backward", scope: !91, file: !84, line: 30, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "link_t", file: !84, line: 7, baseType: !91)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "forward", scope: !91, file: !84, line: 31, baseType: !94, size: 64, offset: 64)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "au_link", scope: !85, file: !84, line: 54, baseType: !90, size: 128, offset: 256)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "author", scope: !85, file: !84, line: 55, baseType: !99, size: 64, offset: 384)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "author", file: !84, line: 48, baseType: !101)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "author", file: !84, line: 41, size: 576, elements: !102)
!102 = !{!103, !104, !105, !106, !107, !108}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "publisher", scope: !101, file: !84, line: 42, baseType: !6, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "description", scope: !101, file: !84, line: 43, baseType: !6, size: 64, offset: 64)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !101, file: !84, line: 44, baseType: !6, size: 64, offset: 128)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "db_link", scope: !101, file: !84, line: 45, baseType: !90, size: 128, offset: 192)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "reviews", scope: !101, file: !84, line: 46, baseType: !90, size: 128, offset: 320)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "books", scope: !101, file: !84, line: 47, baseType: !90, size: 128, offset: 448)
!109 = distinct !DICompileUnit(language: DW_LANG_C99, file: !110, producer: "Ubuntu clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!110 = !DIFile(filename: "/root/klee/runtime/Freestanding/memcpy.c", directory: "/root/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!111 = distinct !DICompileUnit(language: DW_LANG_C99, file: !112, producer: "Ubuntu clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!112 = !DIFile(filename: "/root/klee/runtime/Freestanding/memset.c", directory: "/root/klee/build/runtime/Freestanding", checksumkind: CSK_MD5, checksum: "f66ef9ef9131ab198e93a41b1a9ae1fc")
!113 = !{!"Ubuntu clang version 14.0.6"}
!114 = !{i32 7, !"Dwarf Version", i32 5}
!115 = !{i32 2, !"Debug Info Version", i32 3}
!116 = !{i32 1, !"wchar_size", i32 4}
!117 = !{i32 7, !"PIC Level", i32 2}
!118 = !{i32 7, !"PIE Level", i32 2}
!119 = !{i32 7, !"uwtable", i32 1}
!120 = !{i32 7, !"frame-pointer", i32 2}
!121 = distinct !DISubprogram(name: "main", scope: !80, file: !80, line: 90, type: !122, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !124)
!122 = !DISubroutineType(types: !123)
!123 = !{!72}
!124 = !{}
!125 = !DILocation(line: 91, column: 5, scope: !121)
!126 = !DILocation(line: 92, column: 5, scope: !121)
!127 = !DILocalVariable(name: "au_name", scope: !121, file: !80, line: 93, type: !128)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1024, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 128)
!131 = !DILocation(line: 93, column: 10, scope: !121)
!132 = !DILocalVariable(name: "bk_name", scope: !121, file: !80, line: 94, type: !128)
!133 = !DILocation(line: 94, column: 10, scope: !121)
!134 = !DILocalVariable(name: "au_publ", scope: !121, file: !80, line: 95, type: !128)
!135 = !DILocation(line: 95, column: 10, scope: !121)
!136 = !DILocalVariable(name: "au_desc", scope: !121, file: !80, line: 96, type: !137)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 8192, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 1024)
!140 = !DILocation(line: 96, column: 10, scope: !121)
!141 = !DILocalVariable(name: "bk_desc", scope: !121, file: !80, line: 97, type: !137)
!142 = !DILocation(line: 97, column: 10, scope: !121)
!143 = !DILocation(line: 99, column: 24, scope: !121)
!144 = !DILocation(line: 99, column: 5, scope: !121)
!145 = !DILocation(line: 100, column: 24, scope: !121)
!146 = !DILocation(line: 100, column: 5, scope: !121)
!147 = !DILocation(line: 101, column: 24, scope: !121)
!148 = !DILocation(line: 101, column: 5, scope: !121)
!149 = !DILocation(line: 102, column: 24, scope: !121)
!150 = !DILocation(line: 102, column: 5, scope: !121)
!151 = !DILocation(line: 103, column: 24, scope: !121)
!152 = !DILocation(line: 103, column: 5, scope: !121)
!153 = !DILocation(line: 104, column: 5, scope: !121)
!154 = !DILocation(line: 104, column: 27, scope: !121)
!155 = !DILocation(line: 105, column: 5, scope: !121)
!156 = !DILocation(line: 105, column: 27, scope: !121)
!157 = !DILocation(line: 106, column: 5, scope: !121)
!158 = !DILocation(line: 106, column: 27, scope: !121)
!159 = !DILocation(line: 107, column: 5, scope: !121)
!160 = !DILocation(line: 107, column: 27, scope: !121)
!161 = !DILocation(line: 108, column: 5, scope: !121)
!162 = !DILocation(line: 108, column: 27, scope: !121)
!163 = !DILocation(line: 111, column: 19, scope: !121)
!164 = !DILocation(line: 111, column: 45, scope: !121)
!165 = !DILocation(line: 111, column: 71, scope: !121)
!166 = !DILocation(line: 111, column: 5, scope: !121)
!167 = !DILocation(line: 112, column: 17, scope: !121)
!168 = !DILocation(line: 112, column: 26, scope: !121)
!169 = !DILocation(line: 112, column: 52, scope: !121)
!170 = !DILocation(line: 112, column: 5, scope: !121)
!171 = !DILocalVariable(name: "bk", scope: !121, file: !80, line: 120, type: !82)
!172 = !DILocation(line: 120, column: 11, scope: !121)
!173 = !DILocation(line: 121, column: 18, scope: !174)
!174 = distinct !DILexicalBlock(scope: !121, file: !80, line: 121, column: 9)
!175 = !DILocation(line: 121, column: 26, scope: !174)
!176 = !DILocation(line: 121, column: 9, scope: !121)
!177 = !DILocation(line: 122, column: 14, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !80, line: 121, column: 35)
!179 = !DILocation(line: 122, column: 12, scope: !178)
!180 = !DILocation(line: 123, column: 5, scope: !178)
!181 = !DILocalVariable(name: "auth_ptr", scope: !121, file: !80, line: 125, type: !99)
!182 = !DILocation(line: 125, column: 13, scope: !121)
!183 = !DILocation(line: 126, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !121, file: !80, line: 126, column: 9)
!185 = !DILocation(line: 126, column: 12, scope: !184)
!186 = !DILocation(line: 126, column: 9, scope: !121)
!187 = !DILocation(line: 127, column: 20, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !80, line: 126, column: 21)
!189 = !DILocation(line: 127, column: 24, scope: !188)
!190 = !DILocation(line: 127, column: 18, scope: !188)
!191 = !DILocation(line: 128, column: 5, scope: !188)
!192 = !DILocation(line: 130, column: 19, scope: !121)
!193 = !DILocation(line: 130, column: 5, scope: !121)
!194 = !DILocation(line: 133, column: 9, scope: !195)
!195 = distinct !DILexicalBlock(scope: !121, file: !80, line: 133, column: 9)
!196 = !DILocation(line: 133, column: 9, scope: !121)
!197 = !DILocation(line: 134, column: 34, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !80, line: 133, column: 13)
!199 = !DILocation(line: 134, column: 9, scope: !198)
!200 = !DILocation(line: 135, column: 5, scope: !198)
!201 = !DILocation(line: 137, column: 5, scope: !121)
!202 = distinct !DISubprogram(name: "printf", scope: !3, file: !3, line: 12, type: !203, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!203 = !DISubroutineType(types: !204)
!204 = !{!72, !205, null}
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!207 = !DILocalVariable(name: "fmt", arg: 1, scope: !202, file: !3, line: 12, type: !205)
!208 = !DILocation(line: 12, column: 24, scope: !202)
!209 = !DILocation(line: 12, column: 42, scope: !202)
!210 = !DILocation(line: 12, column: 47, scope: !202)
!211 = distinct !DISubprogram(name: "puts", scope: !3, file: !3, line: 13, type: !212, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!212 = !DISubroutineType(types: !213)
!213 = !{!72, !205}
!214 = !DILocalVariable(name: "s", arg: 1, scope: !211, file: !3, line: 13, type: !205)
!215 = !DILocation(line: 13, column: 22, scope: !211)
!216 = !DILocation(line: 13, column: 33, scope: !211)
!217 = !DILocation(line: 13, column: 36, scope: !211)
!218 = distinct !DISubprogram(name: "putchar", scope: !3, file: !3, line: 14, type: !219, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!219 = !DISubroutineType(types: !220)
!220 = !{!72, !72}
!221 = !DILocalVariable(name: "c", arg: 1, scope: !218, file: !3, line: 14, type: !72)
!222 = !DILocation(line: 14, column: 17, scope: !218)
!223 = !DILocation(line: 14, column: 28, scope: !218)
!224 = !DILocation(line: 14, column: 38, scope: !218)
!225 = !DILocation(line: 14, column: 31, scope: !218)
!226 = distinct !DISubprogram(name: "getchar", scope: !3, file: !3, line: 20, type: !122, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!227 = !DILocation(line: 20, column: 21, scope: !226)
!228 = distinct !DISubprogram(name: "fgets", scope: !3, file: !3, line: 21, type: !229, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!229 = !DISubroutineType(types: !230)
!230 = !{!6, !6, !72, !9}
!231 = !DILocalVariable(name: "s", arg: 1, scope: !228, file: !3, line: 21, type: !6)
!232 = !DILocation(line: 21, column: 19, scope: !228)
!233 = !DILocalVariable(name: "size", arg: 2, scope: !228, file: !3, line: 21, type: !72)
!234 = !DILocation(line: 21, column: 26, scope: !228)
!235 = !DILocalVariable(name: "stream", arg: 3, scope: !228, file: !3, line: 21, type: !9)
!236 = !DILocation(line: 21, column: 38, scope: !228)
!237 = !DILocation(line: 21, column: 54, scope: !228)
!238 = !DILocation(line: 21, column: 63, scope: !228)
!239 = !DILocation(line: 21, column: 75, scope: !228)
!240 = !DILocation(line: 21, column: 83, scope: !228)
!241 = distinct !DISubprogram(name: "__isoc99_scanf", scope: !3, file: !3, line: 22, type: !203, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!242 = !DILocalVariable(name: "fmt", arg: 1, scope: !241, file: !3, line: 22, type: !205)
!243 = !DILocation(line: 22, column: 32, scope: !241)
!244 = !DILocation(line: 22, column: 50, scope: !241)
!245 = !DILocation(line: 22, column: 55, scope: !241)
!246 = distinct !DISubprogram(name: "strlen", scope: !3, file: !3, line: 25, type: !247, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!247 = !DISubroutineType(types: !248)
!248 = !{!249, !205}
!249 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!250 = !DILocalVariable(name: "s", arg: 1, scope: !246, file: !3, line: 25, type: !205)
!251 = !DILocation(line: 25, column: 27, scope: !246)
!252 = !DILocation(line: 26, column: 8, scope: !253)
!253 = distinct !DILexicalBlock(scope: !246, file: !3, line: 26, column: 7)
!254 = !DILocation(line: 26, column: 7, scope: !246)
!255 = !DILocation(line: 26, column: 11, scope: !253)
!256 = !DILocalVariable(name: "n", scope: !246, file: !3, line: 27, type: !257)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !258, line: 46, baseType: !249)
!258 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!259 = !DILocation(line: 27, column: 10, scope: !246)
!260 = !DILocation(line: 28, column: 3, scope: !246)
!261 = !DILocation(line: 28, column: 10, scope: !246)
!262 = !DILocation(line: 28, column: 12, scope: !246)
!263 = !DILocation(line: 28, column: 17, scope: !246)
!264 = distinct !{!264, !260, !263, !265}
!265 = !{!"llvm.loop.mustprogress"}
!266 = !DILocation(line: 29, column: 10, scope: !246)
!267 = !DILocation(line: 29, column: 3, scope: !246)
!268 = !DILocation(line: 30, column: 1, scope: !246)
!269 = distinct !DISubprogram(name: "strnlen", scope: !3, file: !3, line: 32, type: !270, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!270 = !DISubroutineType(types: !271)
!271 = !{!257, !205, !257}
!272 = !DILocalVariable(name: "s", arg: 1, scope: !269, file: !3, line: 32, type: !205)
!273 = !DILocation(line: 32, column: 28, scope: !269)
!274 = !DILocalVariable(name: "maxlen", arg: 2, scope: !269, file: !3, line: 32, type: !257)
!275 = !DILocation(line: 32, column: 38, scope: !269)
!276 = !DILocation(line: 33, column: 8, scope: !277)
!277 = distinct !DILexicalBlock(scope: !269, file: !3, line: 33, column: 7)
!278 = !DILocation(line: 33, column: 7, scope: !269)
!279 = !DILocation(line: 33, column: 11, scope: !277)
!280 = !DILocalVariable(name: "i", scope: !269, file: !3, line: 34, type: !257)
!281 = !DILocation(line: 34, column: 10, scope: !269)
!282 = !DILocation(line: 35, column: 3, scope: !269)
!283 = !DILocation(line: 35, column: 10, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !3, line: 35, column: 3)
!285 = distinct !DILexicalBlock(scope: !269, file: !3, line: 35, column: 3)
!286 = !DILocation(line: 35, column: 14, scope: !284)
!287 = !DILocation(line: 35, column: 12, scope: !284)
!288 = !DILocation(line: 35, column: 21, scope: !284)
!289 = !DILocation(line: 35, column: 24, scope: !284)
!290 = !DILocation(line: 35, column: 26, scope: !284)
!291 = !DILocation(line: 0, scope: !284)
!292 = !DILocation(line: 35, column: 3, scope: !285)
!293 = !DILocation(line: 35, column: 36, scope: !294)
!294 = distinct !DILexicalBlock(scope: !284, file: !3, line: 35, column: 35)
!295 = !DILocation(line: 35, column: 31, scope: !284)
!296 = !DILocation(line: 35, column: 3, scope: !284)
!297 = distinct !{!297, !292, !298, !265}
!298 = !DILocation(line: 35, column: 36, scope: !285)
!299 = !DILocation(line: 36, column: 10, scope: !269)
!300 = !DILocation(line: 36, column: 3, scope: !269)
!301 = !DILocation(line: 37, column: 1, scope: !269)
!302 = distinct !DISubprogram(name: "strcspn", scope: !3, file: !3, line: 39, type: !303, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!303 = !DISubroutineType(types: !304)
!304 = !{!249, !205, !205}
!305 = !DILocalVariable(name: "s", arg: 1, scope: !302, file: !3, line: 39, type: !205)
!306 = !DILocation(line: 39, column: 28, scope: !302)
!307 = !DILocalVariable(name: "reject", arg: 2, scope: !302, file: !3, line: 39, type: !205)
!308 = !DILocation(line: 39, column: 43, scope: !302)
!309 = !DILocation(line: 40, column: 8, scope: !310)
!310 = distinct !DILexicalBlock(scope: !302, file: !3, line: 40, column: 7)
!311 = !DILocation(line: 40, column: 10, scope: !310)
!312 = !DILocation(line: 40, column: 14, scope: !310)
!313 = !DILocation(line: 40, column: 7, scope: !302)
!314 = !DILocation(line: 40, column: 22, scope: !310)
!315 = !DILocalVariable(name: "i", scope: !316, file: !3, line: 41, type: !257)
!316 = distinct !DILexicalBlock(scope: !302, file: !3, line: 41, column: 3)
!317 = !DILocation(line: 41, column: 15, scope: !316)
!318 = !DILocation(line: 41, column: 8, scope: !316)
!319 = !DILocation(line: 41, column: 22, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !3, line: 41, column: 3)
!321 = !DILocation(line: 41, column: 24, scope: !320)
!322 = !DILocation(line: 41, column: 3, scope: !316)
!323 = !DILocalVariable(name: "j", scope: !324, file: !3, line: 42, type: !257)
!324 = distinct !DILexicalBlock(scope: !325, file: !3, line: 42, column: 5)
!325 = distinct !DILexicalBlock(scope: !320, file: !3, line: 41, column: 33)
!326 = !DILocation(line: 42, column: 17, scope: !324)
!327 = !DILocation(line: 42, column: 10, scope: !324)
!328 = !DILocation(line: 42, column: 24, scope: !329)
!329 = distinct !DILexicalBlock(scope: !324, file: !3, line: 42, column: 5)
!330 = !DILocation(line: 42, column: 31, scope: !329)
!331 = !DILocation(line: 42, column: 5, scope: !324)
!332 = !DILocation(line: 43, column: 11, scope: !333)
!333 = distinct !DILexicalBlock(scope: !334, file: !3, line: 43, column: 11)
!334 = distinct !DILexicalBlock(scope: !329, file: !3, line: 42, column: 40)
!335 = !DILocation(line: 43, column: 13, scope: !333)
!336 = !DILocation(line: 43, column: 19, scope: !333)
!337 = !DILocation(line: 43, column: 26, scope: !333)
!338 = !DILocation(line: 43, column: 16, scope: !333)
!339 = !DILocation(line: 43, column: 11, scope: !334)
!340 = !DILocation(line: 43, column: 37, scope: !333)
!341 = !DILocation(line: 43, column: 30, scope: !333)
!342 = !DILocation(line: 44, column: 5, scope: !334)
!343 = !DILocation(line: 42, column: 36, scope: !329)
!344 = !DILocation(line: 42, column: 5, scope: !329)
!345 = distinct !{!345, !331, !346, !265}
!346 = !DILocation(line: 44, column: 5, scope: !324)
!347 = !DILocation(line: 45, column: 3, scope: !325)
!348 = !DILocation(line: 41, column: 29, scope: !320)
!349 = !DILocation(line: 41, column: 3, scope: !320)
!350 = distinct !{!350, !322, !351, !265}
!351 = !DILocation(line: 45, column: 3, scope: !316)
!352 = !DILocation(line: 46, column: 17, scope: !302)
!353 = !DILocation(line: 46, column: 10, scope: !302)
!354 = !DILocation(line: 46, column: 3, scope: !302)
!355 = !DILocation(line: 47, column: 1, scope: !302)
!356 = distinct !DISubprogram(name: "strcmp", scope: !3, file: !3, line: 49, type: !357, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!357 = !DISubroutineType(types: !358)
!358 = !{!72, !205, !205}
!359 = !DILocalVariable(name: "a", arg: 1, scope: !356, file: !3, line: 49, type: !205)
!360 = !DILocation(line: 49, column: 24, scope: !356)
!361 = !DILocalVariable(name: "b", arg: 2, scope: !356, file: !3, line: 49, type: !205)
!362 = !DILocation(line: 49, column: 39, scope: !356)
!363 = !DILocation(line: 50, column: 7, scope: !364)
!364 = distinct !DILexicalBlock(scope: !356, file: !3, line: 50, column: 7)
!365 = !DILocation(line: 50, column: 12, scope: !364)
!366 = !DILocation(line: 50, column: 9, scope: !364)
!367 = !DILocation(line: 50, column: 7, scope: !356)
!368 = !DILocation(line: 50, column: 15, scope: !364)
!369 = !DILocation(line: 51, column: 8, scope: !370)
!370 = distinct !DILexicalBlock(scope: !356, file: !3, line: 51, column: 7)
!371 = !DILocation(line: 51, column: 7, scope: !356)
!372 = !DILocation(line: 51, column: 11, scope: !370)
!373 = !DILocation(line: 52, column: 8, scope: !374)
!374 = distinct !DILexicalBlock(scope: !356, file: !3, line: 52, column: 7)
!375 = !DILocation(line: 52, column: 7, scope: !356)
!376 = !DILocation(line: 52, column: 11, scope: !374)
!377 = !DILocation(line: 53, column: 3, scope: !356)
!378 = !DILocation(line: 53, column: 11, scope: !356)
!379 = !DILocation(line: 53, column: 10, scope: !356)
!380 = !DILocation(line: 53, column: 13, scope: !356)
!381 = !DILocation(line: 53, column: 18, scope: !356)
!382 = !DILocation(line: 53, column: 17, scope: !356)
!383 = !DILocation(line: 53, column: 24, scope: !356)
!384 = !DILocation(line: 53, column: 23, scope: !356)
!385 = !DILocation(line: 53, column: 20, scope: !356)
!386 = !DILocation(line: 0, scope: !356)
!387 = !DILocation(line: 53, column: 31, scope: !388)
!388 = distinct !DILexicalBlock(scope: !356, file: !3, line: 53, column: 28)
!389 = !DILocation(line: 53, column: 36, scope: !388)
!390 = distinct !{!390, !377, !391, !265}
!391 = !DILocation(line: 53, column: 40, scope: !356)
!392 = !DILocation(line: 54, column: 26, scope: !356)
!393 = !DILocation(line: 54, column: 25, scope: !356)
!394 = !DILocation(line: 54, column: 10, scope: !356)
!395 = !DILocation(line: 54, column: 46, scope: !356)
!396 = !DILocation(line: 54, column: 45, scope: !356)
!397 = !DILocation(line: 54, column: 30, scope: !356)
!398 = !DILocation(line: 54, column: 28, scope: !356)
!399 = !DILocation(line: 54, column: 3, scope: !356)
!400 = !DILocation(line: 55, column: 1, scope: !356)
!401 = distinct !DISubprogram(name: "strncpy", scope: !3, file: !3, line: 57, type: !402, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!402 = !DISubroutineType(types: !403)
!403 = !{!6, !6, !205, !257}
!404 = !DILocalVariable(name: "dst", arg: 1, scope: !401, file: !3, line: 57, type: !6)
!405 = !DILocation(line: 57, column: 21, scope: !401)
!406 = !DILocalVariable(name: "src", arg: 2, scope: !401, file: !3, line: 57, type: !205)
!407 = !DILocation(line: 57, column: 38, scope: !401)
!408 = !DILocalVariable(name: "n", arg: 3, scope: !401, file: !3, line: 57, type: !257)
!409 = !DILocation(line: 57, column: 50, scope: !401)
!410 = !DILocation(line: 58, column: 8, scope: !411)
!411 = distinct !DILexicalBlock(scope: !401, file: !3, line: 58, column: 7)
!412 = !DILocation(line: 58, column: 12, scope: !411)
!413 = !DILocation(line: 58, column: 16, scope: !411)
!414 = !DILocation(line: 58, column: 7, scope: !401)
!415 = !DILocation(line: 58, column: 28, scope: !411)
!416 = !DILocation(line: 58, column: 21, scope: !411)
!417 = !DILocalVariable(name: "i", scope: !401, file: !3, line: 59, type: !257)
!418 = !DILocation(line: 59, column: 10, scope: !401)
!419 = !DILocation(line: 60, column: 3, scope: !401)
!420 = !DILocation(line: 60, column: 10, scope: !421)
!421 = distinct !DILexicalBlock(scope: !422, file: !3, line: 60, column: 3)
!422 = distinct !DILexicalBlock(scope: !401, file: !3, line: 60, column: 3)
!423 = !DILocation(line: 60, column: 14, scope: !421)
!424 = !DILocation(line: 60, column: 12, scope: !421)
!425 = !DILocation(line: 60, column: 16, scope: !421)
!426 = !DILocation(line: 60, column: 19, scope: !421)
!427 = !DILocation(line: 60, column: 23, scope: !421)
!428 = !DILocation(line: 0, scope: !421)
!429 = !DILocation(line: 60, column: 3, scope: !422)
!430 = !DILocation(line: 60, column: 41, scope: !421)
!431 = !DILocation(line: 60, column: 45, scope: !421)
!432 = !DILocation(line: 60, column: 32, scope: !421)
!433 = !DILocation(line: 60, column: 36, scope: !421)
!434 = !DILocation(line: 60, column: 39, scope: !421)
!435 = !DILocation(line: 60, column: 28, scope: !421)
!436 = !DILocation(line: 60, column: 3, scope: !421)
!437 = distinct !{!437, !429, !438, !265}
!438 = !DILocation(line: 60, column: 46, scope: !422)
!439 = !DILocation(line: 61, column: 3, scope: !401)
!440 = !DILocation(line: 61, column: 10, scope: !441)
!441 = distinct !DILexicalBlock(scope: !442, file: !3, line: 61, column: 3)
!442 = distinct !DILexicalBlock(scope: !401, file: !3, line: 61, column: 3)
!443 = !DILocation(line: 61, column: 14, scope: !441)
!444 = !DILocation(line: 61, column: 12, scope: !441)
!445 = !DILocation(line: 61, column: 3, scope: !442)
!446 = !DILocation(line: 61, column: 22, scope: !441)
!447 = !DILocation(line: 61, column: 26, scope: !441)
!448 = !DILocation(line: 61, column: 29, scope: !441)
!449 = !DILocation(line: 61, column: 18, scope: !441)
!450 = !DILocation(line: 61, column: 3, scope: !441)
!451 = distinct !{!451, !445, !452, !265}
!452 = !DILocation(line: 61, column: 31, scope: !442)
!453 = !DILocation(line: 62, column: 10, scope: !401)
!454 = !DILocation(line: 62, column: 3, scope: !401)
!455 = !DILocation(line: 63, column: 1, scope: !401)
!456 = distinct !DISubprogram(name: "strdup", scope: !3, file: !3, line: 65, type: !457, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!457 = !DISubroutineType(types: !458)
!458 = !{!6, !205}
!459 = !DILocalVariable(name: "s", arg: 1, scope: !456, file: !3, line: 65, type: !205)
!460 = !DILocation(line: 65, column: 26, scope: !456)
!461 = !DILocation(line: 66, column: 8, scope: !462)
!462 = distinct !DILexicalBlock(scope: !456, file: !3, line: 66, column: 7)
!463 = !DILocation(line: 66, column: 7, scope: !456)
!464 = !DILocation(line: 66, column: 11, scope: !462)
!465 = !DILocalVariable(name: "n", scope: !456, file: !3, line: 67, type: !257)
!466 = !DILocation(line: 67, column: 10, scope: !456)
!467 = !DILocation(line: 67, column: 21, scope: !456)
!468 = !DILocation(line: 67, column: 14, scope: !456)
!469 = !DILocation(line: 67, column: 24, scope: !456)
!470 = !DILocalVariable(name: "p", scope: !456, file: !3, line: 68, type: !6)
!471 = !DILocation(line: 68, column: 9, scope: !456)
!472 = !DILocation(line: 68, column: 28, scope: !456)
!473 = !DILocation(line: 68, column: 21, scope: !456)
!474 = !DILocation(line: 69, column: 8, scope: !475)
!475 = distinct !DILexicalBlock(scope: !456, file: !3, line: 69, column: 7)
!476 = !DILocation(line: 69, column: 7, scope: !456)
!477 = !DILocation(line: 69, column: 11, scope: !475)
!478 = !DILocalVariable(name: "i", scope: !479, file: !3, line: 70, type: !257)
!479 = distinct !DILexicalBlock(scope: !456, file: !3, line: 70, column: 3)
!480 = !DILocation(line: 70, column: 15, scope: !479)
!481 = !DILocation(line: 70, column: 8, scope: !479)
!482 = !DILocation(line: 70, column: 22, scope: !483)
!483 = distinct !DILexicalBlock(scope: !479, file: !3, line: 70, column: 3)
!484 = !DILocation(line: 70, column: 26, scope: !483)
!485 = !DILocation(line: 70, column: 24, scope: !483)
!486 = !DILocation(line: 70, column: 3, scope: !479)
!487 = !DILocation(line: 70, column: 41, scope: !483)
!488 = !DILocation(line: 70, column: 43, scope: !483)
!489 = !DILocation(line: 70, column: 34, scope: !483)
!490 = !DILocation(line: 70, column: 36, scope: !483)
!491 = !DILocation(line: 70, column: 39, scope: !483)
!492 = !DILocation(line: 70, column: 30, scope: !483)
!493 = !DILocation(line: 70, column: 3, scope: !483)
!494 = distinct !{!494, !486, !495, !265}
!495 = !DILocation(line: 70, column: 44, scope: !479)
!496 = !DILocation(line: 71, column: 10, scope: !456)
!497 = !DILocation(line: 71, column: 3, scope: !456)
!498 = !DILocation(line: 72, column: 1, scope: !456)
!499 = distinct !DISubprogram(name: "strtol", scope: !3, file: !3, line: 74, type: !500, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!500 = !DISubroutineType(types: !501)
!501 = !{!502, !205, !503, !72}
!502 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!503 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!504 = !DILocalVariable(name: "nptr", arg: 1, scope: !499, file: !3, line: 74, type: !205)
!505 = !DILocation(line: 74, column: 25, scope: !499)
!506 = !DILocalVariable(name: "endptr", arg: 2, scope: !499, file: !3, line: 74, type: !503)
!507 = !DILocation(line: 74, column: 38, scope: !499)
!508 = !DILocalVariable(name: "base", arg: 3, scope: !499, file: !3, line: 74, type: !72)
!509 = !DILocation(line: 74, column: 50, scope: !499)
!510 = !DILocation(line: 75, column: 9, scope: !499)
!511 = !DILocation(line: 76, column: 8, scope: !512)
!512 = distinct !DILexicalBlock(scope: !499, file: !3, line: 76, column: 7)
!513 = !DILocation(line: 76, column: 7, scope: !499)
!514 = !DILocation(line: 76, column: 20, scope: !515)
!515 = distinct !DILexicalBlock(scope: !516, file: !3, line: 76, column: 20)
!516 = distinct !DILexicalBlock(scope: !512, file: !3, line: 76, column: 14)
!517 = !DILocation(line: 76, column: 20, scope: !516)
!518 = !DILocation(line: 76, column: 45, scope: !515)
!519 = !DILocation(line: 76, column: 29, scope: !515)
!520 = !DILocation(line: 76, column: 36, scope: !515)
!521 = !DILocation(line: 76, column: 28, scope: !515)
!522 = !DILocation(line: 76, column: 51, scope: !516)
!523 = !DILocalVariable(name: "v", scope: !499, file: !3, line: 77, type: !502)
!524 = !DILocation(line: 77, column: 8, scope: !499)
!525 = !DILocalVariable(name: "p", scope: !499, file: !3, line: 78, type: !205)
!526 = !DILocation(line: 78, column: 15, scope: !499)
!527 = !DILocation(line: 78, column: 19, scope: !499)
!528 = !DILocation(line: 79, column: 3, scope: !499)
!529 = !DILocation(line: 79, column: 11, scope: !499)
!530 = !DILocation(line: 79, column: 10, scope: !499)
!531 = !DILocation(line: 79, column: 13, scope: !499)
!532 = !DILocation(line: 79, column: 20, scope: !499)
!533 = !DILocation(line: 79, column: 24, scope: !499)
!534 = !DILocation(line: 79, column: 23, scope: !499)
!535 = !DILocation(line: 79, column: 26, scope: !499)
!536 = !DILocation(line: 0, scope: !499)
!537 = !DILocation(line: 79, column: 40, scope: !538)
!538 = distinct !DILexicalBlock(scope: !499, file: !3, line: 79, column: 34)
!539 = !DILocation(line: 79, column: 42, scope: !538)
!540 = !DILocation(line: 79, column: 51, scope: !538)
!541 = !DILocation(line: 79, column: 50, scope: !538)
!542 = !DILocation(line: 79, column: 53, scope: !538)
!543 = !DILocation(line: 79, column: 49, scope: !538)
!544 = !DILocation(line: 79, column: 47, scope: !538)
!545 = !DILocation(line: 79, column: 38, scope: !538)
!546 = !DILocation(line: 79, column: 62, scope: !538)
!547 = distinct !{!547, !528, !548, !265}
!548 = !DILocation(line: 79, column: 66, scope: !499)
!549 = !DILocation(line: 80, column: 7, scope: !550)
!550 = distinct !DILexicalBlock(scope: !499, file: !3, line: 80, column: 7)
!551 = !DILocation(line: 80, column: 7, scope: !499)
!552 = !DILocation(line: 80, column: 32, scope: !550)
!553 = !DILocation(line: 80, column: 16, scope: !550)
!554 = !DILocation(line: 80, column: 23, scope: !550)
!555 = !DILocation(line: 80, column: 15, scope: !550)
!556 = !DILocation(line: 81, column: 10, scope: !499)
!557 = !DILocation(line: 81, column: 3, scope: !499)
!558 = !DILocation(line: 82, column: 1, scope: !499)
!559 = distinct !DISubprogram(name: "sin", scope: !3, file: !3, line: 85, type: !560, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!560 = !DISubroutineType(types: !561)
!561 = !{!562, !562}
!562 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!563 = !DILocalVariable(name: "x", arg: 1, scope: !559, file: !3, line: 85, type: !562)
!564 = !DILocation(line: 85, column: 19, scope: !559)
!565 = !DILocation(line: 85, column: 30, scope: !559)
!566 = !DILocation(line: 85, column: 33, scope: !559)
!567 = distinct !DISubprogram(name: "cos", scope: !3, file: !3, line: 86, type: !560, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!568 = !DILocalVariable(name: "x", arg: 1, scope: !567, file: !3, line: 86, type: !562)
!569 = !DILocation(line: 86, column: 19, scope: !567)
!570 = !DILocation(line: 86, column: 30, scope: !567)
!571 = !DILocation(line: 86, column: 33, scope: !567)
!572 = distinct !DISubprogram(name: "llround", scope: !3, file: !3, line: 87, type: !573, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!573 = !DISubroutineType(types: !574)
!574 = !{!575, !562}
!575 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!576 = !DILocalVariable(name: "x", arg: 1, scope: !572, file: !3, line: 87, type: !562)
!577 = !DILocation(line: 87, column: 26, scope: !572)
!578 = !DILocation(line: 87, column: 37, scope: !572)
!579 = !DILocation(line: 87, column: 40, scope: !572)
!580 = distinct !DISubprogram(name: "print_card", scope: !3, file: !3, line: 90, type: !581, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!581 = !DISubroutineType(types: !582)
!582 = !{null}
!583 = !DILocation(line: 90, column: 24, scope: !580)
!584 = distinct !DISubprogram(name: "exit", scope: !3, file: !3, line: 93, type: !585, scopeLine: 93, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !124)
!585 = !DISubroutineType(types: !586)
!586 = !{null, !72}
!587 = !DILocalVariable(name: "code", arg: 1, scope: !584, file: !3, line: 93, type: !72)
!588 = !DILocation(line: 93, column: 15, scope: !584)
!589 = !DILocation(line: 94, column: 9, scope: !584)
!590 = !DILocation(line: 98, column: 3, scope: !584)
!591 = distinct !DISubprogram(name: "alloc_struct", scope: !13, file: !13, line: 5, type: !592, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!592 = !DISubroutineType(types: !593)
!593 = !{!9, !257}
!594 = !DILocalVariable(name: "size", arg: 1, scope: !591, file: !13, line: 5, type: !257)
!595 = !DILocation(line: 5, column: 27, scope: !591)
!596 = !DILocalVariable(name: "ptr", scope: !591, file: !13, line: 6, type: !9)
!597 = !DILocation(line: 6, column: 11, scope: !591)
!598 = !DILocation(line: 6, column: 24, scope: !591)
!599 = !DILocation(line: 6, column: 17, scope: !591)
!600 = !DILocation(line: 7, column: 10, scope: !601)
!601 = distinct !DILexicalBlock(scope: !591, file: !13, line: 7, column: 9)
!602 = !DILocation(line: 7, column: 9, scope: !591)
!603 = !DILocation(line: 8, column: 9, scope: !601)
!604 = !DILocation(line: 9, column: 12, scope: !591)
!605 = !DILocation(line: 9, column: 20, scope: !591)
!606 = !DILocation(line: 9, column: 5, scope: !591)
!607 = !DILocation(line: 10, column: 12, scope: !591)
!608 = !DILocation(line: 10, column: 5, scope: !591)
!609 = !DILocation(line: 11, column: 1, scope: !591)
!610 = distinct !DISubprogram(name: "link_init", scope: !13, file: !13, line: 13, type: !611, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!611 = !DISubroutineType(types: !612)
!612 = !{null, !33}
!613 = !DILocalVariable(name: "newl", arg: 1, scope: !610, file: !13, line: 13, type: !33)
!614 = !DILocation(line: 13, column: 24, scope: !610)
!615 = !DILocation(line: 14, column: 5, scope: !610)
!616 = !DILocation(line: 14, column: 11, scope: !610)
!617 = !DILocation(line: 14, column: 20, scope: !610)
!618 = !DILocation(line: 15, column: 5, scope: !610)
!619 = !DILocation(line: 15, column: 11, scope: !610)
!620 = !DILocation(line: 15, column: 19, scope: !610)
!621 = !DILocation(line: 16, column: 1, scope: !610)
!622 = distinct !DISubprogram(name: "link_prepend", scope: !13, file: !13, line: 18, type: !623, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!623 = !DISubroutineType(types: !624)
!624 = !{null, !33, !33}
!625 = !DILocalVariable(name: "list", arg: 1, scope: !622, file: !13, line: 18, type: !33)
!626 = !DILocation(line: 18, column: 27, scope: !622)
!627 = !DILocalVariable(name: "newl", arg: 2, scope: !622, file: !13, line: 18, type: !33)
!628 = !DILocation(line: 18, column: 41, scope: !622)
!629 = !DILocation(line: 19, column: 22, scope: !622)
!630 = !DILocation(line: 19, column: 5, scope: !622)
!631 = !DILocation(line: 19, column: 11, scope: !622)
!632 = !DILocation(line: 19, column: 20, scope: !622)
!633 = !DILocation(line: 20, column: 9, scope: !634)
!634 = distinct !DILexicalBlock(scope: !622, file: !13, line: 20, column: 9)
!635 = !DILocation(line: 20, column: 15, scope: !634)
!636 = !DILocation(line: 20, column: 23, scope: !634)
!637 = !DILocation(line: 20, column: 9, scope: !622)
!638 = !DILocation(line: 21, column: 9, scope: !639)
!639 = distinct !DILexicalBlock(scope: !634, file: !13, line: 20, column: 32)
!640 = !DILocation(line: 21, column: 15, scope: !639)
!641 = !DILocation(line: 21, column: 23, scope: !639)
!642 = !DILocation(line: 22, column: 5, scope: !639)
!643 = !DILocation(line: 23, column: 25, scope: !644)
!644 = distinct !DILexicalBlock(scope: !634, file: !13, line: 22, column: 12)
!645 = !DILocation(line: 23, column: 31, scope: !644)
!646 = !DILocation(line: 23, column: 9, scope: !644)
!647 = !DILocation(line: 23, column: 15, scope: !644)
!648 = !DILocation(line: 23, column: 23, scope: !644)
!649 = !DILocation(line: 24, column: 37, scope: !644)
!650 = !DILocation(line: 24, column: 10, scope: !644)
!651 = !DILocation(line: 24, column: 16, scope: !644)
!652 = !DILocation(line: 24, column: 26, scope: !644)
!653 = !DILocation(line: 24, column: 35, scope: !644)
!654 = !DILocation(line: 27, column: 21, scope: !622)
!655 = !DILocation(line: 27, column: 5, scope: !622)
!656 = !DILocation(line: 27, column: 11, scope: !622)
!657 = !DILocation(line: 27, column: 19, scope: !622)
!658 = !DILocation(line: 28, column: 5, scope: !622)
!659 = distinct !DISubprogram(name: "link_unlink", scope: !13, file: !13, line: 31, type: !611, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!660 = !DILocalVariable(name: "dell", arg: 1, scope: !659, file: !13, line: 31, type: !33)
!661 = !DILocation(line: 31, column: 26, scope: !659)
!662 = !DILocation(line: 32, column: 5, scope: !663)
!663 = distinct !DILexicalBlock(scope: !664, file: !13, line: 32, column: 5)
!664 = distinct !DILexicalBlock(scope: !659, file: !13, line: 32, column: 5)
!665 = !DILocation(line: 32, column: 5, scope: !664)
!666 = !DILocation(line: 33, column: 33, scope: !659)
!667 = !DILocation(line: 33, column: 39, scope: !659)
!668 = !DILocation(line: 33, column: 6, scope: !659)
!669 = !DILocation(line: 33, column: 12, scope: !659)
!670 = !DILocation(line: 33, column: 23, scope: !659)
!671 = !DILocation(line: 33, column: 31, scope: !659)
!672 = !DILocation(line: 34, column: 9, scope: !673)
!673 = distinct !DILexicalBlock(scope: !659, file: !13, line: 34, column: 9)
!674 = !DILocation(line: 34, column: 15, scope: !673)
!675 = !DILocation(line: 34, column: 23, scope: !673)
!676 = !DILocation(line: 34, column: 9, scope: !659)
!677 = !DILocation(line: 35, column: 37, scope: !678)
!678 = distinct !DILexicalBlock(scope: !673, file: !13, line: 34, column: 42)
!679 = !DILocation(line: 35, column: 43, scope: !678)
!680 = !DILocation(line: 35, column: 10, scope: !678)
!681 = !DILocation(line: 35, column: 16, scope: !678)
!682 = !DILocation(line: 35, column: 26, scope: !678)
!683 = !DILocation(line: 35, column: 35, scope: !678)
!684 = !DILocation(line: 36, column: 5, scope: !678)
!685 = !DILocation(line: 38, column: 5, scope: !659)
!686 = !DILocation(line: 38, column: 11, scope: !659)
!687 = !DILocation(line: 38, column: 20, scope: !659)
!688 = !DILocation(line: 39, column: 5, scope: !659)
!689 = !DILocation(line: 39, column: 11, scope: !659)
!690 = !DILocation(line: 39, column: 19, scope: !659)
!691 = !DILocation(line: 40, column: 1, scope: !659)
!692 = distinct !DISubprogram(name: "link_nxbook_db", scope: !13, file: !13, line: 42, type: !693, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!693 = !DISubroutineType(types: !694)
!694 = !{!41, !33}
!695 = !DILocalVariable(name: "bk_link", arg: 1, scope: !692, file: !13, line: 42, type: !33)
!696 = !DILocation(line: 42, column: 30, scope: !692)
!697 = !DILocation(line: 43, column: 9, scope: !698)
!698 = distinct !DILexicalBlock(scope: !692, file: !13, line: 43, column: 9)
!699 = !DILocation(line: 43, column: 17, scope: !698)
!700 = !DILocation(line: 43, column: 25, scope: !698)
!701 = !DILocation(line: 43, column: 28, scope: !698)
!702 = !DILocation(line: 43, column: 37, scope: !698)
!703 = !DILocation(line: 43, column: 45, scope: !698)
!704 = !DILocation(line: 43, column: 9, scope: !692)
!705 = !DILocation(line: 44, column: 9, scope: !706)
!706 = distinct !DILexicalBlock(scope: !698, file: !13, line: 43, column: 54)
!707 = !DILocation(line: 47, column: 12, scope: !692)
!708 = !DILocation(line: 47, column: 5, scope: !692)
!709 = !DILocation(line: 48, column: 1, scope: !692)
!710 = distinct !DISubprogram(name: "link_nxbook_au", scope: !13, file: !13, line: 50, type: !693, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!711 = !DILocalVariable(name: "bk_link", arg: 1, scope: !710, file: !13, line: 50, type: !33)
!712 = !DILocation(line: 50, column: 30, scope: !710)
!713 = !DILocation(line: 51, column: 9, scope: !714)
!714 = distinct !DILexicalBlock(scope: !710, file: !13, line: 51, column: 9)
!715 = !DILocation(line: 51, column: 17, scope: !714)
!716 = !DILocation(line: 51, column: 25, scope: !714)
!717 = !DILocation(line: 51, column: 28, scope: !714)
!718 = !DILocation(line: 51, column: 37, scope: !714)
!719 = !DILocation(line: 51, column: 45, scope: !714)
!720 = !DILocation(line: 51, column: 9, scope: !710)
!721 = !DILocation(line: 52, column: 9, scope: !722)
!722 = distinct !DILexicalBlock(scope: !714, file: !13, line: 51, column: 54)
!723 = !DILocation(line: 55, column: 12, scope: !710)
!724 = !DILocation(line: 55, column: 5, scope: !710)
!725 = !DILocation(line: 56, column: 1, scope: !710)
!726 = distinct !DISubprogram(name: "link_nxauthor_db", scope: !13, file: !13, line: 58, type: !727, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!727 = !DISubroutineType(types: !728)
!728 = !{!50, !33}
!729 = !DILocalVariable(name: "au_link", arg: 1, scope: !726, file: !13, line: 58, type: !33)
!730 = !DILocation(line: 58, column: 34, scope: !726)
!731 = !DILocation(line: 59, column: 9, scope: !732)
!732 = distinct !DILexicalBlock(scope: !726, file: !13, line: 59, column: 9)
!733 = !DILocation(line: 59, column: 17, scope: !732)
!734 = !DILocation(line: 59, column: 25, scope: !732)
!735 = !DILocation(line: 59, column: 28, scope: !732)
!736 = !DILocation(line: 59, column: 37, scope: !732)
!737 = !DILocation(line: 59, column: 45, scope: !732)
!738 = !DILocation(line: 59, column: 9, scope: !726)
!739 = !DILocation(line: 60, column: 9, scope: !740)
!740 = distinct !DILexicalBlock(scope: !732, file: !13, line: 59, column: 54)
!741 = !DILocation(line: 63, column: 12, scope: !726)
!742 = !DILocation(line: 63, column: 5, scope: !726)
!743 = !DILocation(line: 64, column: 1, scope: !726)
!744 = distinct !DISubprogram(name: "link_nxreview_au", scope: !13, file: !13, line: 66, type: !745, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!745 = !DISubroutineType(types: !746)
!746 = !{!60, !33}
!747 = !DILocalVariable(name: "au_link", arg: 1, scope: !744, file: !13, line: 66, type: !33)
!748 = !DILocation(line: 66, column: 34, scope: !744)
!749 = !DILocation(line: 67, column: 9, scope: !750)
!750 = distinct !DILexicalBlock(scope: !744, file: !13, line: 67, column: 9)
!751 = !DILocation(line: 67, column: 17, scope: !750)
!752 = !DILocation(line: 67, column: 25, scope: !750)
!753 = !DILocation(line: 67, column: 28, scope: !750)
!754 = !DILocation(line: 67, column: 37, scope: !750)
!755 = !DILocation(line: 67, column: 45, scope: !750)
!756 = !DILocation(line: 67, column: 9, scope: !744)
!757 = !DILocation(line: 68, column: 9, scope: !758)
!758 = distinct !DILexicalBlock(scope: !750, file: !13, line: 67, column: 54)
!759 = !DILocation(line: 71, column: 12, scope: !744)
!760 = !DILocation(line: 71, column: 5, scope: !744)
!761 = !DILocation(line: 72, column: 1, scope: !744)
!762 = distinct !DISubprogram(name: "find_author", scope: !13, file: !13, line: 74, type: !763, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!763 = !DISubroutineType(types: !764)
!764 = !{!50, !6}
!765 = !DILocalVariable(name: "name", arg: 1, scope: !762, file: !13, line: 74, type: !6)
!766 = !DILocation(line: 74, column: 27, scope: !762)
!767 = !DILocation(line: 75, column: 20, scope: !768)
!768 = distinct !DILexicalBlock(scope: !762, file: !13, line: 75, column: 9)
!769 = !DILocation(line: 75, column: 28, scope: !768)
!770 = !DILocation(line: 75, column: 9, scope: !762)
!771 = !DILocation(line: 75, column: 47, scope: !768)
!772 = !DILocalVariable(name: "fauth", scope: !773, file: !13, line: 76, type: !50)
!773 = distinct !DILexicalBlock(scope: !762, file: !13, line: 76, column: 5)
!774 = !DILocation(line: 76, column: 18, scope: !773)
!775 = !DILocation(line: 76, column: 26, scope: !773)
!776 = !DILocation(line: 76, column: 10, scope: !773)
!777 = !DILocation(line: 77, column: 10, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !13, line: 76, column: 5)
!779 = !DILocation(line: 77, column: 16, scope: !778)
!780 = !DILocation(line: 76, column: 5, scope: !773)
!781 = !DILocation(line: 78, column: 20, scope: !782)
!782 = distinct !DILexicalBlock(scope: !783, file: !13, line: 78, column: 13)
!783 = distinct !DILexicalBlock(scope: !778, file: !13, line: 77, column: 68)
!784 = !DILocation(line: 78, column: 27, scope: !782)
!785 = !DILocation(line: 78, column: 33, scope: !782)
!786 = !DILocation(line: 78, column: 13, scope: !782)
!787 = !DILocation(line: 78, column: 39, scope: !782)
!788 = !DILocation(line: 78, column: 13, scope: !783)
!789 = !DILocation(line: 78, column: 52, scope: !782)
!790 = !DILocation(line: 78, column: 45, scope: !782)
!791 = !DILocation(line: 79, column: 5, scope: !783)
!792 = !DILocation(line: 77, column: 51, scope: !778)
!793 = !DILocation(line: 77, column: 58, scope: !778)
!794 = !DILocation(line: 77, column: 33, scope: !778)
!795 = !DILocation(line: 77, column: 31, scope: !778)
!796 = !DILocation(line: 76, column: 5, scope: !778)
!797 = distinct !{!797, !780, !798, !265}
!798 = !DILocation(line: 79, column: 5, scope: !773)
!799 = !DILocation(line: 80, column: 5, scope: !762)
!800 = !DILocation(line: 81, column: 1, scope: !762)
!801 = distinct !DISubprogram(name: "find_book", scope: !13, file: !13, line: 83, type: !802, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!802 = !DISubroutineType(types: !803)
!803 = !{!41, !6}
!804 = !DILocalVariable(name: "name", arg: 1, scope: !801, file: !13, line: 83, type: !6)
!805 = !DILocation(line: 83, column: 23, scope: !801)
!806 = !DILocation(line: 84, column: 18, scope: !807)
!807 = distinct !DILexicalBlock(scope: !801, file: !13, line: 84, column: 9)
!808 = !DILocation(line: 84, column: 26, scope: !807)
!809 = !DILocation(line: 84, column: 9, scope: !801)
!810 = !DILocation(line: 84, column: 45, scope: !807)
!811 = !DILocalVariable(name: "fbook", scope: !812, file: !13, line: 85, type: !41)
!812 = distinct !DILexicalBlock(scope: !801, file: !13, line: 85, column: 5)
!813 = !DILocation(line: 85, column: 16, scope: !812)
!814 = !DILocation(line: 85, column: 24, scope: !812)
!815 = !DILocation(line: 85, column: 10, scope: !812)
!816 = !DILocation(line: 86, column: 10, scope: !817)
!817 = distinct !DILexicalBlock(scope: !812, file: !13, line: 85, column: 5)
!818 = !DILocation(line: 86, column: 16, scope: !817)
!819 = !DILocation(line: 85, column: 5, scope: !812)
!820 = !DILocation(line: 87, column: 20, scope: !821)
!821 = distinct !DILexicalBlock(scope: !822, file: !13, line: 87, column: 13)
!822 = distinct !DILexicalBlock(scope: !817, file: !13, line: 86, column: 66)
!823 = !DILocation(line: 87, column: 27, scope: !821)
!824 = !DILocation(line: 87, column: 33, scope: !821)
!825 = !DILocation(line: 87, column: 13, scope: !821)
!826 = !DILocation(line: 87, column: 39, scope: !821)
!827 = !DILocation(line: 87, column: 13, scope: !822)
!828 = !DILocation(line: 87, column: 52, scope: !821)
!829 = !DILocation(line: 87, column: 45, scope: !821)
!830 = !DILocation(line: 88, column: 5, scope: !822)
!831 = !DILocation(line: 86, column: 49, scope: !817)
!832 = !DILocation(line: 86, column: 56, scope: !817)
!833 = !DILocation(line: 86, column: 33, scope: !817)
!834 = !DILocation(line: 86, column: 31, scope: !817)
!835 = !DILocation(line: 85, column: 5, scope: !817)
!836 = distinct !{!836, !819, !837, !265}
!837 = !DILocation(line: 88, column: 5, scope: !812)
!838 = !DILocation(line: 89, column: 5, scope: !801)
!839 = !DILocation(line: 90, column: 1, scope: !801)
!840 = distinct !DISubprogram(name: "free_author", scope: !13, file: !13, line: 92, type: !841, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!841 = !DISubroutineType(types: !842)
!842 = !{null, !50}
!843 = !DILocalVariable(name: "auth", arg: 1, scope: !840, file: !13, line: 92, type: !50)
!844 = !DILocation(line: 92, column: 26, scope: !840)
!845 = !DILocation(line: 93, column: 9, scope: !846)
!846 = distinct !DILexicalBlock(scope: !840, file: !13, line: 93, column: 9)
!847 = !DILocation(line: 93, column: 15, scope: !846)
!848 = !DILocation(line: 93, column: 20, scope: !846)
!849 = !DILocation(line: 93, column: 9, scope: !840)
!850 = !DILocation(line: 94, column: 14, scope: !851)
!851 = distinct !DILexicalBlock(scope: !846, file: !13, line: 93, column: 29)
!852 = !DILocation(line: 94, column: 20, scope: !851)
!853 = !DILocation(line: 94, column: 9, scope: !851)
!854 = !DILocation(line: 95, column: 5, scope: !851)
!855 = !DILocation(line: 97, column: 9, scope: !856)
!856 = distinct !DILexicalBlock(scope: !840, file: !13, line: 97, column: 9)
!857 = !DILocation(line: 97, column: 15, scope: !856)
!858 = !DILocation(line: 97, column: 25, scope: !856)
!859 = !DILocation(line: 97, column: 9, scope: !840)
!860 = !DILocation(line: 98, column: 14, scope: !861)
!861 = distinct !DILexicalBlock(scope: !856, file: !13, line: 97, column: 34)
!862 = !DILocation(line: 98, column: 20, scope: !861)
!863 = !DILocation(line: 98, column: 9, scope: !861)
!864 = !DILocation(line: 99, column: 5, scope: !861)
!865 = !DILocation(line: 101, column: 9, scope: !866)
!866 = distinct !DILexicalBlock(scope: !840, file: !13, line: 101, column: 9)
!867 = !DILocation(line: 101, column: 15, scope: !866)
!868 = !DILocation(line: 101, column: 27, scope: !866)
!869 = !DILocation(line: 101, column: 9, scope: !840)
!870 = !DILocation(line: 102, column: 14, scope: !871)
!871 = distinct !DILexicalBlock(scope: !866, file: !13, line: 101, column: 36)
!872 = !DILocation(line: 102, column: 20, scope: !871)
!873 = !DILocation(line: 102, column: 9, scope: !871)
!874 = !DILocation(line: 103, column: 5, scope: !871)
!875 = !DILocation(line: 105, column: 10, scope: !840)
!876 = !DILocation(line: 105, column: 5, scope: !840)
!877 = !DILocation(line: 106, column: 1, scope: !840)
!878 = distinct !DISubprogram(name: "free_book", scope: !13, file: !13, line: 108, type: !879, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!879 = !DISubroutineType(types: !880)
!880 = !{null, !41}
!881 = !DILocalVariable(name: "bk", arg: 1, scope: !878, file: !13, line: 108, type: !41)
!882 = !DILocation(line: 108, column: 22, scope: !878)
!883 = !DILocation(line: 109, column: 9, scope: !884)
!884 = distinct !DILexicalBlock(scope: !878, file: !13, line: 109, column: 9)
!885 = !DILocation(line: 109, column: 13, scope: !884)
!886 = !DILocation(line: 109, column: 18, scope: !884)
!887 = !DILocation(line: 109, column: 9, scope: !878)
!888 = !DILocation(line: 110, column: 14, scope: !889)
!889 = distinct !DILexicalBlock(scope: !884, file: !13, line: 109, column: 27)
!890 = !DILocation(line: 110, column: 18, scope: !889)
!891 = !DILocation(line: 110, column: 9, scope: !889)
!892 = !DILocation(line: 111, column: 5, scope: !889)
!893 = !DILocation(line: 113, column: 9, scope: !894)
!894 = distinct !DILexicalBlock(scope: !878, file: !13, line: 113, column: 9)
!895 = !DILocation(line: 113, column: 13, scope: !894)
!896 = !DILocation(line: 113, column: 25, scope: !894)
!897 = !DILocation(line: 113, column: 9, scope: !878)
!898 = !DILocation(line: 114, column: 14, scope: !899)
!899 = distinct !DILexicalBlock(scope: !894, file: !13, line: 113, column: 34)
!900 = !DILocation(line: 114, column: 18, scope: !899)
!901 = !DILocation(line: 114, column: 9, scope: !899)
!902 = !DILocation(line: 115, column: 5, scope: !899)
!903 = !DILocation(line: 117, column: 10, scope: !878)
!904 = !DILocation(line: 117, column: 5, scope: !878)
!905 = !DILocation(line: 118, column: 1, scope: !878)
!906 = distinct !DISubprogram(name: "free_book_reviews", scope: !13, file: !13, line: 120, type: !879, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!907 = !DILocalVariable(name: "bk", arg: 1, scope: !906, file: !13, line: 120, type: !41)
!908 = !DILocation(line: 120, column: 30, scope: !906)
!909 = !DILocalVariable(name: "tmp", scope: !906, file: !13, line: 121, type: !60)
!910 = !DILocation(line: 121, column: 13, scope: !906)
!911 = !DILocalVariable(name: "auth", scope: !906, file: !13, line: 123, type: !50)
!912 = !DILocation(line: 123, column: 13, scope: !906)
!913 = !DILocation(line: 123, column: 20, scope: !906)
!914 = !DILocation(line: 123, column: 24, scope: !906)
!915 = !DILocation(line: 124, column: 9, scope: !916)
!916 = distinct !DILexicalBlock(scope: !906, file: !13, line: 124, column: 9)
!917 = !DILocation(line: 124, column: 15, scope: !916)
!918 = !DILocation(line: 124, column: 23, scope: !916)
!919 = !DILocation(line: 124, column: 31, scope: !916)
!920 = !DILocation(line: 124, column: 9, scope: !906)
!921 = !DILocation(line: 125, column: 9, scope: !922)
!922 = distinct !DILexicalBlock(scope: !916, file: !13, line: 124, column: 50)
!923 = !DILocalVariable(name: "rev", scope: !906, file: !13, line: 128, type: !60)
!924 = !DILocation(line: 128, column: 13, scope: !906)
!925 = !DILocation(line: 128, column: 19, scope: !906)
!926 = !DILocation(line: 129, column: 5, scope: !906)
!927 = !DILocation(line: 129, column: 12, scope: !906)
!928 = !DILocation(line: 129, column: 16, scope: !906)
!929 = !DILocation(line: 130, column: 15, scope: !930)
!930 = distinct !DILexicalBlock(scope: !906, file: !13, line: 129, column: 25)
!931 = !DILocation(line: 130, column: 13, scope: !930)
!932 = !DILocation(line: 131, column: 33, scope: !930)
!933 = !DILocation(line: 131, column: 38, scope: !930)
!934 = !DILocation(line: 131, column: 15, scope: !930)
!935 = !DILocation(line: 131, column: 13, scope: !930)
!936 = !DILocation(line: 132, column: 13, scope: !937)
!937 = distinct !DILexicalBlock(scope: !930, file: !13, line: 132, column: 13)
!938 = !DILocation(line: 132, column: 18, scope: !937)
!939 = !DILocation(line: 132, column: 26, scope: !937)
!940 = !DILocation(line: 132, column: 23, scope: !937)
!941 = !DILocation(line: 132, column: 13, scope: !930)
!942 = !DILocation(line: 133, column: 26, scope: !943)
!943 = distinct !DILexicalBlock(scope: !937, file: !13, line: 132, column: 30)
!944 = !DILocation(line: 133, column: 31, scope: !943)
!945 = !DILocation(line: 133, column: 13, scope: !943)
!946 = !DILocation(line: 134, column: 18, scope: !943)
!947 = !DILocation(line: 134, column: 13, scope: !943)
!948 = !DILocation(line: 135, column: 9, scope: !943)
!949 = distinct !{!949, !926, !950, !265}
!950 = !DILocation(line: 136, column: 5, scope: !906)
!951 = !DILocation(line: 138, column: 5, scope: !906)
!952 = !DILocation(line: 139, column: 1, scope: !906)
!953 = distinct !DISubprogram(name: "create_author", scope: !13, file: !13, line: 141, type: !954, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!954 = !DISubroutineType(types: !955)
!955 = !{!956, !6, !72, !6, !72, !6, !72}
!956 = !DIDerivedType(tag: DW_TAG_typedef, name: "CREATE_CODE", file: !16, line: 15, baseType: !15)
!957 = !DILocalVariable(name: "name", arg: 1, scope: !953, file: !13, line: 141, type: !6)
!958 = !DILocation(line: 141, column: 34, scope: !953)
!959 = !DILocalVariable(name: "name_n", arg: 2, scope: !953, file: !13, line: 141, type: !72)
!960 = !DILocation(line: 141, column: 44, scope: !953)
!961 = !DILocalVariable(name: "publisher", arg: 3, scope: !953, file: !13, line: 141, type: !6)
!962 = !DILocation(line: 141, column: 58, scope: !953)
!963 = !DILocalVariable(name: "publ_n", arg: 4, scope: !953, file: !13, line: 142, type: !72)
!964 = !DILocation(line: 142, column: 21, scope: !953)
!965 = !DILocalVariable(name: "description", arg: 5, scope: !953, file: !13, line: 142, type: !6)
!966 = !DILocation(line: 142, column: 35, scope: !953)
!967 = !DILocalVariable(name: "desc_n", arg: 6, scope: !953, file: !13, line: 142, type: !72)
!968 = !DILocation(line: 142, column: 52, scope: !953)
!969 = !DILocalVariable(name: "new_author", scope: !953, file: !13, line: 143, type: !50)
!970 = !DILocation(line: 143, column: 13, scope: !953)
!971 = !DILocation(line: 143, column: 26, scope: !953)
!972 = !DILocation(line: 144, column: 9, scope: !973)
!973 = distinct !DILexicalBlock(scope: !953, file: !13, line: 144, column: 9)
!974 = !DILocation(line: 144, column: 20, scope: !973)
!975 = !DILocation(line: 144, column: 9, scope: !953)
!976 = !DILocation(line: 145, column: 9, scope: !977)
!977 = distinct !DILexicalBlock(scope: !973, file: !13, line: 144, column: 39)
!978 = !DILocation(line: 148, column: 16, scope: !953)
!979 = !DILocation(line: 148, column: 28, scope: !953)
!980 = !DILocation(line: 148, column: 5, scope: !953)
!981 = !DILocation(line: 149, column: 16, scope: !953)
!982 = !DILocation(line: 149, column: 28, scope: !953)
!983 = !DILocation(line: 149, column: 5, scope: !953)
!984 = !DILocation(line: 150, column: 16, scope: !953)
!985 = !DILocation(line: 150, column: 28, scope: !953)
!986 = !DILocation(line: 150, column: 5, scope: !953)
!987 = !DILocation(line: 152, column: 31, scope: !953)
!988 = !DILocation(line: 152, column: 24, scope: !953)
!989 = !DILocation(line: 152, column: 5, scope: !953)
!990 = !DILocation(line: 152, column: 17, scope: !953)
!991 = !DILocation(line: 152, column: 22, scope: !953)
!992 = !DILocation(line: 153, column: 9, scope: !993)
!993 = distinct !DILexicalBlock(scope: !953, file: !13, line: 153, column: 9)
!994 = !DILocation(line: 153, column: 21, scope: !993)
!995 = !DILocation(line: 153, column: 26, scope: !993)
!996 = !DILocation(line: 153, column: 9, scope: !953)
!997 = !DILocation(line: 154, column: 21, scope: !998)
!998 = distinct !DILexicalBlock(scope: !993, file: !13, line: 153, column: 43)
!999 = !DILocation(line: 154, column: 9, scope: !998)
!1000 = !DILocation(line: 155, column: 9, scope: !998)
!1001 = !DILocation(line: 157, column: 12, scope: !953)
!1002 = !DILocation(line: 157, column: 24, scope: !953)
!1003 = !DILocation(line: 157, column: 30, scope: !953)
!1004 = !DILocation(line: 157, column: 36, scope: !953)
!1005 = !DILocation(line: 157, column: 5, scope: !953)
!1006 = !DILocation(line: 158, column: 5, scope: !953)
!1007 = !DILocation(line: 158, column: 17, scope: !953)
!1008 = !DILocation(line: 158, column: 22, scope: !953)
!1009 = !DILocation(line: 158, column: 29, scope: !953)
!1010 = !DILocation(line: 158, column: 34, scope: !953)
!1011 = !DILocation(line: 160, column: 36, scope: !953)
!1012 = !DILocation(line: 160, column: 29, scope: !953)
!1013 = !DILocation(line: 160, column: 5, scope: !953)
!1014 = !DILocation(line: 160, column: 17, scope: !953)
!1015 = !DILocation(line: 160, column: 27, scope: !953)
!1016 = !DILocation(line: 161, column: 9, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !953, file: !13, line: 161, column: 9)
!1018 = !DILocation(line: 161, column: 21, scope: !1017)
!1019 = !DILocation(line: 161, column: 31, scope: !1017)
!1020 = !DILocation(line: 161, column: 9, scope: !953)
!1021 = !DILocation(line: 162, column: 21, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1017, file: !13, line: 161, column: 48)
!1023 = !DILocation(line: 162, column: 9, scope: !1022)
!1024 = !DILocation(line: 163, column: 9, scope: !1022)
!1025 = !DILocation(line: 165, column: 12, scope: !953)
!1026 = !DILocation(line: 165, column: 24, scope: !953)
!1027 = !DILocation(line: 165, column: 35, scope: !953)
!1028 = !DILocation(line: 165, column: 46, scope: !953)
!1029 = !DILocation(line: 165, column: 5, scope: !953)
!1030 = !DILocation(line: 166, column: 5, scope: !953)
!1031 = !DILocation(line: 166, column: 17, scope: !953)
!1032 = !DILocation(line: 166, column: 27, scope: !953)
!1033 = !DILocation(line: 166, column: 34, scope: !953)
!1034 = !DILocation(line: 166, column: 39, scope: !953)
!1035 = !DILocation(line: 168, column: 38, scope: !953)
!1036 = !DILocation(line: 168, column: 31, scope: !953)
!1037 = !DILocation(line: 168, column: 5, scope: !953)
!1038 = !DILocation(line: 168, column: 17, scope: !953)
!1039 = !DILocation(line: 168, column: 29, scope: !953)
!1040 = !DILocation(line: 169, column: 9, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !953, file: !13, line: 169, column: 9)
!1042 = !DILocation(line: 169, column: 21, scope: !1041)
!1043 = !DILocation(line: 169, column: 33, scope: !1041)
!1044 = !DILocation(line: 169, column: 9, scope: !953)
!1045 = !DILocation(line: 170, column: 21, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1041, file: !13, line: 169, column: 50)
!1047 = !DILocation(line: 170, column: 9, scope: !1046)
!1048 = !DILocation(line: 171, column: 9, scope: !1046)
!1049 = !DILocation(line: 173, column: 12, scope: !953)
!1050 = !DILocation(line: 173, column: 24, scope: !953)
!1051 = !DILocation(line: 173, column: 37, scope: !953)
!1052 = !DILocation(line: 173, column: 50, scope: !953)
!1053 = !DILocation(line: 173, column: 5, scope: !953)
!1054 = !DILocation(line: 174, column: 5, scope: !953)
!1055 = !DILocation(line: 174, column: 17, scope: !953)
!1056 = !DILocation(line: 174, column: 29, scope: !953)
!1057 = !DILocation(line: 174, column: 36, scope: !953)
!1058 = !DILocation(line: 174, column: 41, scope: !953)
!1059 = !DILocation(line: 176, column: 32, scope: !953)
!1060 = !DILocation(line: 176, column: 44, scope: !953)
!1061 = !DILocation(line: 176, column: 5, scope: !953)
!1062 = !DILocation(line: 177, column: 5, scope: !953)
!1063 = !DILocation(line: 178, column: 1, scope: !953)
!1064 = distinct !DISubprogram(name: "create_book", scope: !13, file: !13, line: 180, type: !1065, scopeLine: 181, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!956, !6, !6, !72, !6, !72}
!1067 = !DILocalVariable(name: "au_name", arg: 1, scope: !1064, file: !13, line: 180, type: !6)
!1068 = !DILocation(line: 180, column: 32, scope: !1064)
!1069 = !DILocalVariable(name: "bk_name", arg: 2, scope: !1064, file: !13, line: 180, type: !6)
!1070 = !DILocation(line: 180, column: 47, scope: !1064)
!1071 = !DILocalVariable(name: "name_n", arg: 3, scope: !1064, file: !13, line: 180, type: !72)
!1072 = !DILocation(line: 180, column: 60, scope: !1064)
!1073 = !DILocalVariable(name: "description", arg: 4, scope: !1064, file: !13, line: 181, type: !6)
!1074 = !DILocation(line: 181, column: 23, scope: !1064)
!1075 = !DILocalVariable(name: "desc_n", arg: 5, scope: !1064, file: !13, line: 181, type: !72)
!1076 = !DILocation(line: 181, column: 40, scope: !1064)
!1077 = !DILocalVariable(name: "author_name", scope: !1064, file: !13, line: 182, type: !6)
!1078 = !DILocation(line: 182, column: 14, scope: !1064)
!1079 = !DILocalVariable(name: "new_book", scope: !1064, file: !13, line: 184, type: !41)
!1080 = !DILocation(line: 184, column: 11, scope: !1064)
!1081 = !DILocation(line: 184, column: 22, scope: !1064)
!1082 = !DILocation(line: 185, column: 9, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1064, file: !13, line: 185, column: 9)
!1084 = !DILocation(line: 185, column: 18, scope: !1083)
!1085 = !DILocation(line: 185, column: 9, scope: !1064)
!1086 = !DILocation(line: 186, column: 9, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1083, file: !13, line: 185, column: 35)
!1088 = !DILocation(line: 189, column: 36, scope: !1064)
!1089 = !DILocation(line: 189, column: 24, scope: !1064)
!1090 = !DILocation(line: 189, column: 5, scope: !1064)
!1091 = !DILocation(line: 189, column: 15, scope: !1064)
!1092 = !DILocation(line: 189, column: 22, scope: !1064)
!1093 = !DILocation(line: 190, column: 9, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1064, file: !13, line: 190, column: 9)
!1095 = !DILocation(line: 190, column: 19, scope: !1094)
!1096 = !DILocation(line: 190, column: 26, scope: !1094)
!1097 = !DILocation(line: 190, column: 9, scope: !1064)
!1098 = !DILocation(line: 191, column: 19, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1094, file: !13, line: 190, column: 45)
!1100 = !DILocation(line: 191, column: 9, scope: !1099)
!1101 = !DILocation(line: 192, column: 9, scope: !1099)
!1102 = !DILocation(line: 195, column: 29, scope: !1064)
!1103 = !DILocation(line: 195, column: 22, scope: !1064)
!1104 = !DILocation(line: 195, column: 5, scope: !1064)
!1105 = !DILocation(line: 195, column: 15, scope: !1064)
!1106 = !DILocation(line: 195, column: 20, scope: !1064)
!1107 = !DILocation(line: 196, column: 9, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1064, file: !13, line: 196, column: 9)
!1109 = !DILocation(line: 196, column: 19, scope: !1108)
!1110 = !DILocation(line: 196, column: 24, scope: !1108)
!1111 = !DILocation(line: 196, column: 9, scope: !1064)
!1112 = !DILocation(line: 197, column: 19, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1108, file: !13, line: 196, column: 41)
!1114 = !DILocation(line: 197, column: 9, scope: !1113)
!1115 = !DILocation(line: 198, column: 9, scope: !1113)
!1116 = !DILocation(line: 200, column: 12, scope: !1064)
!1117 = !DILocation(line: 200, column: 22, scope: !1064)
!1118 = !DILocation(line: 200, column: 28, scope: !1064)
!1119 = !DILocation(line: 200, column: 37, scope: !1064)
!1120 = !DILocation(line: 200, column: 5, scope: !1064)
!1121 = !DILocation(line: 201, column: 5, scope: !1064)
!1122 = !DILocation(line: 201, column: 15, scope: !1064)
!1123 = !DILocation(line: 201, column: 20, scope: !1064)
!1124 = !DILocation(line: 201, column: 27, scope: !1064)
!1125 = !DILocation(line: 201, column: 32, scope: !1064)
!1126 = !DILocation(line: 203, column: 36, scope: !1064)
!1127 = !DILocation(line: 203, column: 29, scope: !1064)
!1128 = !DILocation(line: 203, column: 5, scope: !1064)
!1129 = !DILocation(line: 203, column: 15, scope: !1064)
!1130 = !DILocation(line: 203, column: 27, scope: !1064)
!1131 = !DILocation(line: 204, column: 9, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1064, file: !13, line: 204, column: 9)
!1133 = !DILocation(line: 204, column: 19, scope: !1132)
!1134 = !DILocation(line: 204, column: 31, scope: !1132)
!1135 = !DILocation(line: 204, column: 9, scope: !1064)
!1136 = !DILocation(line: 205, column: 19, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1132, file: !13, line: 204, column: 48)
!1138 = !DILocation(line: 205, column: 9, scope: !1137)
!1139 = !DILocation(line: 206, column: 9, scope: !1137)
!1140 = !DILocation(line: 208, column: 12, scope: !1064)
!1141 = !DILocation(line: 208, column: 22, scope: !1064)
!1142 = !DILocation(line: 208, column: 35, scope: !1064)
!1143 = !DILocation(line: 208, column: 48, scope: !1064)
!1144 = !DILocation(line: 208, column: 5, scope: !1064)
!1145 = !DILocation(line: 209, column: 5, scope: !1064)
!1146 = !DILocation(line: 209, column: 15, scope: !1064)
!1147 = !DILocation(line: 209, column: 27, scope: !1064)
!1148 = !DILocation(line: 209, column: 34, scope: !1064)
!1149 = !DILocation(line: 209, column: 39, scope: !1064)
!1150 = !DILocation(line: 211, column: 30, scope: !1064)
!1151 = !DILocation(line: 211, column: 40, scope: !1064)
!1152 = !DILocation(line: 211, column: 5, scope: !1064)
!1153 = !DILocation(line: 212, column: 20, scope: !1064)
!1154 = !DILocation(line: 212, column: 30, scope: !1064)
!1155 = !DILocation(line: 212, column: 39, scope: !1064)
!1156 = !DILocation(line: 212, column: 47, scope: !1064)
!1157 = !DILocation(line: 212, column: 57, scope: !1064)
!1158 = !DILocation(line: 212, column: 5, scope: !1064)
!1159 = !DILocation(line: 213, column: 5, scope: !1064)
!1160 = !DILocation(line: 214, column: 1, scope: !1064)
!1161 = distinct !DISubprogram(name: "create_review", scope: !13, file: !13, line: 216, type: !1162, scopeLine: 216, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!1164, !6, !72}
!1164 = !DIDerivedType(tag: DW_TAG_typedef, name: "EDIT_CODE", file: !16, line: 27, baseType: !22)
!1165 = !DILocalVariable(name: "bname", arg: 1, scope: !1161, file: !13, line: 216, type: !6)
!1166 = !DILocation(line: 216, column: 31, scope: !1161)
!1167 = !DILocalVariable(name: "rating", arg: 2, scope: !1161, file: !13, line: 216, type: !72)
!1168 = !DILocation(line: 216, column: 42, scope: !1161)
!1169 = !DILocation(line: 217, column: 9, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1161, file: !13, line: 217, column: 9)
!1171 = !DILocation(line: 217, column: 16, scope: !1170)
!1172 = !DILocation(line: 217, column: 20, scope: !1170)
!1173 = !DILocation(line: 217, column: 23, scope: !1170)
!1174 = !DILocation(line: 217, column: 30, scope: !1170)
!1175 = !DILocation(line: 217, column: 9, scope: !1161)
!1176 = !DILocation(line: 218, column: 9, scope: !1170)
!1177 = !DILocalVariable(name: "rbook", scope: !1161, file: !13, line: 220, type: !41)
!1178 = !DILocation(line: 220, column: 11, scope: !1161)
!1179 = !DILocation(line: 220, column: 29, scope: !1161)
!1180 = !DILocation(line: 220, column: 19, scope: !1161)
!1181 = !DILocation(line: 221, column: 9, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1161, file: !13, line: 221, column: 9)
!1183 = !DILocation(line: 221, column: 15, scope: !1182)
!1184 = !DILocation(line: 221, column: 9, scope: !1161)
!1185 = !DILocation(line: 222, column: 9, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1182, file: !13, line: 221, column: 32)
!1187 = !DILocalVariable(name: "auth", scope: !1161, file: !13, line: 225, type: !50)
!1188 = !DILocation(line: 225, column: 13, scope: !1161)
!1189 = !DILocation(line: 225, column: 20, scope: !1161)
!1190 = !DILocation(line: 225, column: 27, scope: !1161)
!1191 = !DILocation(line: 226, column: 5, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1193, file: !13, line: 226, column: 5)
!1193 = distinct !DILexicalBlock(scope: !1161, file: !13, line: 226, column: 5)
!1194 = !DILocation(line: 226, column: 5, scope: !1193)
!1195 = !DILocalVariable(name: "rev", scope: !1161, file: !13, line: 228, type: !60)
!1196 = !DILocation(line: 228, column: 13, scope: !1161)
!1197 = !DILocation(line: 228, column: 19, scope: !1161)
!1198 = !DILocation(line: 229, column: 9, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1161, file: !13, line: 229, column: 9)
!1200 = !DILocation(line: 229, column: 13, scope: !1199)
!1201 = !DILocation(line: 229, column: 9, scope: !1161)
!1202 = !DILocation(line: 230, column: 9, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1199, file: !13, line: 229, column: 32)
!1204 = !DILocation(line: 233, column: 19, scope: !1161)
!1205 = !DILocation(line: 233, column: 5, scope: !1161)
!1206 = !DILocation(line: 233, column: 10, scope: !1161)
!1207 = !DILocation(line: 233, column: 17, scope: !1161)
!1208 = !DILocation(line: 234, column: 17, scope: !1161)
!1209 = !DILocation(line: 234, column: 5, scope: !1161)
!1210 = !DILocation(line: 234, column: 10, scope: !1161)
!1211 = !DILocation(line: 234, column: 15, scope: !1161)
!1212 = !DILocation(line: 235, column: 19, scope: !1161)
!1213 = !DILocation(line: 235, column: 5, scope: !1161)
!1214 = !DILocation(line: 235, column: 10, scope: !1161)
!1215 = !DILocation(line: 235, column: 17, scope: !1161)
!1216 = !DILocation(line: 237, column: 19, scope: !1161)
!1217 = !DILocation(line: 237, column: 25, scope: !1161)
!1218 = !DILocation(line: 237, column: 35, scope: !1161)
!1219 = !DILocation(line: 237, column: 40, scope: !1161)
!1220 = !DILocation(line: 237, column: 5, scope: !1161)
!1221 = !DILocation(line: 238, column: 5, scope: !1161)
!1222 = !DILocation(line: 239, column: 1, scope: !1161)
!1223 = distinct !DISubprogram(name: "delete_author", scope: !13, file: !13, line: 241, type: !1224, scopeLine: 241, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{!1226, !6}
!1226 = !DIDerivedType(tag: DW_TAG_typedef, name: "DELETE_CODE", file: !16, line: 20, baseType: !28)
!1227 = !DILocalVariable(name: "name", arg: 1, scope: !1223, file: !13, line: 241, type: !6)
!1228 = !DILocation(line: 241, column: 33, scope: !1223)
!1229 = !DILocalVariable(name: "del_author", scope: !1223, file: !13, line: 242, type: !50)
!1230 = !DILocation(line: 242, column: 13, scope: !1223)
!1231 = !DILocation(line: 242, column: 38, scope: !1223)
!1232 = !DILocation(line: 242, column: 26, scope: !1223)
!1233 = !DILocation(line: 243, column: 9, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1223, file: !13, line: 243, column: 9)
!1235 = !DILocation(line: 243, column: 20, scope: !1234)
!1236 = !DILocation(line: 243, column: 9, scope: !1223)
!1237 = !DILocation(line: 244, column: 9, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1234, file: !13, line: 243, column: 39)
!1239 = !DILocation(line: 247, column: 18, scope: !1223)
!1240 = !DILocation(line: 247, column: 30, scope: !1223)
!1241 = !DILocation(line: 247, column: 5, scope: !1223)
!1242 = !DILocation(line: 248, column: 17, scope: !1223)
!1243 = !DILocation(line: 248, column: 5, scope: !1223)
!1244 = !DILocation(line: 249, column: 5, scope: !1223)
!1245 = !DILocation(line: 250, column: 1, scope: !1223)
!1246 = distinct !DISubprogram(name: "delete_book", scope: !13, file: !13, line: 252, type: !1224, scopeLine: 252, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !124)
!1247 = !DILocalVariable(name: "name", arg: 1, scope: !1246, file: !13, line: 252, type: !6)
!1248 = !DILocation(line: 252, column: 31, scope: !1246)
!1249 = !DILocalVariable(name: "rev", scope: !1246, file: !13, line: 253, type: !60)
!1250 = !DILocation(line: 253, column: 13, scope: !1246)
!1251 = !DILocalVariable(name: "del_book", scope: !1246, file: !13, line: 255, type: !41)
!1252 = !DILocation(line: 255, column: 11, scope: !1246)
!1253 = !DILocation(line: 255, column: 32, scope: !1246)
!1254 = !DILocation(line: 255, column: 22, scope: !1246)
!1255 = !DILocation(line: 256, column: 9, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1246, file: !13, line: 256, column: 9)
!1257 = !DILocation(line: 256, column: 18, scope: !1256)
!1258 = !DILocation(line: 256, column: 9, scope: !1246)
!1259 = !DILocation(line: 257, column: 9, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1256, file: !13, line: 256, column: 35)
!1261 = !DILocation(line: 260, column: 23, scope: !1246)
!1262 = !DILocation(line: 260, column: 5, scope: !1246)
!1263 = !DILocation(line: 261, column: 18, scope: !1246)
!1264 = !DILocation(line: 261, column: 28, scope: !1246)
!1265 = !DILocation(line: 261, column: 5, scope: !1246)
!1266 = !DILocation(line: 262, column: 18, scope: !1246)
!1267 = !DILocation(line: 262, column: 28, scope: !1246)
!1268 = !DILocation(line: 262, column: 5, scope: !1246)
!1269 = !DILocation(line: 263, column: 15, scope: !1246)
!1270 = !DILocation(line: 263, column: 5, scope: !1246)
!1271 = !DILocation(line: 264, column: 5, scope: !1246)
!1272 = !DILocation(line: 265, column: 1, scope: !1246)
!1273 = distinct !DISubprogram(name: "memcpy", scope: !1274, file: !1274, line: 12, type: !1275, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !109, retainedNodes: !124)
!1274 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/root/klee", checksumkind: CSK_MD5, checksum: "c636d77d986b2156da8c1ff12af1c5cd")
!1275 = !DISubroutineType(types: !1276)
!1276 = !{!9, !9, !1277, !257}
!1277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1278, size: 64)
!1278 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1279 = !DILocalVariable(name: "destaddr", arg: 1, scope: !1273, file: !1274, line: 12, type: !9)
!1280 = !DILocation(line: 12, column: 20, scope: !1273)
!1281 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !1273, file: !1274, line: 12, type: !1277)
!1282 = !DILocation(line: 12, column: 42, scope: !1273)
!1283 = !DILocalVariable(name: "len", arg: 3, scope: !1273, file: !1274, line: 12, type: !257)
!1284 = !DILocation(line: 12, column: 58, scope: !1273)
!1285 = !DILocalVariable(name: "dest", scope: !1273, file: !1274, line: 13, type: !6)
!1286 = !DILocation(line: 13, column: 9, scope: !1273)
!1287 = !DILocation(line: 13, column: 16, scope: !1273)
!1288 = !DILocalVariable(name: "src", scope: !1273, file: !1274, line: 14, type: !205)
!1289 = !DILocation(line: 14, column: 15, scope: !1273)
!1290 = !DILocation(line: 14, column: 21, scope: !1273)
!1291 = !DILocation(line: 16, column: 3, scope: !1273)
!1292 = !DILocation(line: 16, column: 13, scope: !1273)
!1293 = !DILocation(line: 16, column: 16, scope: !1273)
!1294 = !DILocation(line: 17, column: 19, scope: !1273)
!1295 = !DILocation(line: 17, column: 15, scope: !1273)
!1296 = !DILocation(line: 17, column: 10, scope: !1273)
!1297 = !DILocation(line: 17, column: 13, scope: !1273)
!1298 = distinct !{!1298, !1291, !1294, !265}
!1299 = !DILocation(line: 18, column: 10, scope: !1273)
!1300 = !DILocation(line: 18, column: 3, scope: !1273)
!1301 = distinct !DISubprogram(name: "memset", scope: !1302, file: !1302, line: 12, type: !1303, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !111, retainedNodes: !124)
!1302 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/root/klee", checksumkind: CSK_MD5, checksum: "f66ef9ef9131ab198e93a41b1a9ae1fc")
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!9, !9, !72, !257}
!1305 = !DILocalVariable(name: "dst", arg: 1, scope: !1301, file: !1302, line: 12, type: !9)
!1306 = !DILocation(line: 12, column: 20, scope: !1301)
!1307 = !DILocalVariable(name: "s", arg: 2, scope: !1301, file: !1302, line: 12, type: !72)
!1308 = !DILocation(line: 12, column: 29, scope: !1301)
!1309 = !DILocalVariable(name: "count", arg: 3, scope: !1301, file: !1302, line: 12, type: !257)
!1310 = !DILocation(line: 12, column: 39, scope: !1301)
!1311 = !DILocalVariable(name: "a", scope: !1301, file: !1302, line: 13, type: !6)
!1312 = !DILocation(line: 13, column: 9, scope: !1301)
!1313 = !DILocation(line: 13, column: 13, scope: !1301)
!1314 = !DILocation(line: 14, column: 3, scope: !1301)
!1315 = !DILocation(line: 14, column: 15, scope: !1301)
!1316 = !DILocation(line: 14, column: 18, scope: !1301)
!1317 = !DILocation(line: 15, column: 12, scope: !1301)
!1318 = !DILocation(line: 15, column: 7, scope: !1301)
!1319 = !DILocation(line: 15, column: 10, scope: !1301)
!1320 = distinct !{!1320, !1314, !1317, !265}
!1321 = !DILocation(line: 16, column: 10, scope: !1301)
!1322 = !DILocation(line: 16, column: 3, scope: !1301)
